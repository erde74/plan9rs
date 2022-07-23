KiB = 1024
MiB = 1048576

PGSZ = 4 * KiB        /* page size */
PTSZ = (4*KiB)        /* page table page size */

MACHSZ = (4*KiB)    	/* Mach+stack size */
MACHSTKSZ = (6*(4*KiB))    /* Mach stack size */

/*
 *  Address spaces. Kernel, sorted by address.
 */
KZERO = 0xffff800000000000
KSYS = KZERO + 1 * MiB + 1 * PGSZ
KTZERO = (KZERO + 2 * MiB)

PteP = 0x0000000000000001	    /* Present */
PteRW = 0x0000000000000002    /* Read/Write */
PtePS = 0x0000000000000080 

Pse = 0x00000010
Pae = 0x00000020
Pge = 0x00000080

Efer = 0xc0000080

Lme = 0x00000100
Nxe = 0x00000800

Mp = 0x00000002
Ts = 0x00000008
Wp = 0x00010000
Nw = 0x20000000
Cd = 0x40000000 /* Cache Disable */
Pg = 0x80000000

GdtCODE64 =	(1<<3)

.align 4
.section .boottext, "awx"
multiboot_header:
    .long 0x1badb002
	.long 0x00000003
	.long -(0x1badb002 + 0x00000003)

// When we get here we are in protected mode with a GDT.  We set
// up IA32e mode and get into long mode with paging enabled.
.code32
.align 4
.globl _start
_start:
	mov    start - KZERO, ebp
	jmp    ebp

.text
.code32
.align 4
start:
    cli
	cld

	// Save the multiboot magic number.
	mov 	ebp, eax

	// Make the basic page tables for CPU0 to map 0-4GiB
	// physical to KZERO, in addition to an identity map
	// for the switch from protected to paged mode.  There
	// is an assumption here that the creation and later
	// removal of the identity map will not interfere with
	// the KZERO mappings.
	//
	// We assume a recent processor with Page Size Extensions
	// and use two 2MiB entries.

	// Zero the stack, page tables, vsvm, unused pages, m, sys, etc.
	mov    esi, (KSYS - KZERO)
	mov    ecx, (KTZERO-KSYS / 4)
	xor    eax,eax
	mov    edi,esi
	rep    stos DWORD PTR es:[edi],eax

	// We could zero the BSS here, but the loader does it for us.

	// Set the stack and find the start of the page tables.
	mov    eax, esi
	mov    eax, MACHSTKSZ
	mov    esp, eax    					// Give ourselves a stack

	// %eax points to the PML4 that we'll use for double-mapping
	// low RAM and KZERO.
	mov    cr3, eax						// load the MMU; paging still disabled
	mov    edx, eax
	add    edx, (2 * PTSZ | PteRW | PteP)// EPML3 at IPML4 + 2*PTSZ
	mov    DWORD PTR [eax], edx			// IPML4E for identity map
	mov    DWORD PTR [eax+0x800], edx	// IPML4E for KZERO

	// The next page frame contains a PML4 that removes the double
	// mapping, leaving only KZERO mapped.
	add    eax, PTSZ					// EPML4 at IPML4 + PTSZ
	mov    DWORD PTR [eax+0x800], edx	// EPML4E for EMPL3 at KZERO

	// Fill in the early PML3 (PDPT) to point the early PML2's (PDs)
	// that provide the initial 4GiB mapping in the kernel.
	add    eax, PTSZ					// EPML3 at EPML4 + PTSZ
	add    edx, PTSZ					// EPML2[0] at EPML3 + PTSZ
	mov    DWORD PTR [eax], edx			// EPML3E for EPML2[0]
	add    edx, PTSZ					// EPML2[1] at EPML2[0] + PTSZ
	mov    DWORD PTR [eax+0x8], edx		// EPML3E for EPML2[1]
	add    edx, PTSZ					// EPML2[2] at EPML2[1] + PTSZ
	mov    DWORD PTR [eax+0x10], edx	// EPML3E for EPML2[2]
	add    edx, PTSZ					// EPML2[3] at EPML2[2] + PTSZ
	mov    DWORD PTR [eax+0x18], edx	// EPML3E for EPML2[3]

	// Map the first 4GiB (the entire 32-bit) address space.
	// Note that this requires 16KiB.
	//
	// The first 2MiB are mapped using 4KiB pages.  The first 1MiB
	// memory contains holes for MMIO and ROM and other things that
	// we want special attributes for.  We'll set those in the
	// kernel proper, but we provide 4KiB pages here.  There is 4KiB
	// of RAM for the PT immediately after the PDs.
	add    eax, PTSZ					// PML2[0] at PML3[0] + PTSZ
	mov    ecx, 0x800					// 2048 * 2MiB pages covers 4GiB
	mov    edx, (PtePS | PteRW |PteP)	// Large page PDEs
1:	mov    DWORD PTR [eax],edx			// PDE for 2MiB pages
	add    eax, 0x8
	add    edx, 0x200000				// 2 << 20
	sub    ecx,0x1
	test   ecx,ecx
	jnz    1b

	// %eax now points to the page after the EPML2s, which is the real
	// self-referential PML4.
	// Map the first 192 entries for the upper portion of the address
	// to PML3s; this is the primordial root of sharing for the kernel.
	mov    edx, eax
	add    edx, (PTSZ|PteRW|PteP)		// PML3[0] at PML4 + PTSZ
	mov    ecx, 0x100
1:	mov    DWORD PTR [eax + ecx * 8],edx
	add    edx, PTSZ
	inc    ecx
	cmp    ecx, (256 + 192)
	jne    1b

	// Enable and activate Long Mode.  From the manual:
	// make sure Page Size Extentions are off, and Page Global
	// Extensions and Physical Address Extensions are on in CR4;
	// set Long Mode Enable in the Extended Feature Enable MSR;
	// set Paging Enable in CR0;
	// make an inter-segment jump to the Long Mode code.
	// It`s all in 32-bit mode until the jump is made.
	mov    eax, cr4
	and    eax, ~Pse					// Page Size
	or     eax, (Pge | Pae)				// Page Global, Phys. Address
	mov    cr4, eax

	mov    ecx, Efer					// Extended Feature Enable
	rdmsr
	or     eax, Lme						// Long Mode Enable
	or     eax, Nxe
	wrmsr

	mov    edx, cr0
	and    edx, ~(Cd|Nw|Ts|Mp)
	or     edx, Pg | Wp					// Paging Enable
	mov    cr0, edx

	// Load the 64-bit GDT
	mov    eax, (gdtdesc - KZERO)
	lgdt   [eax]

.att_syntax
	ljmpl	$GdtCODE64, $(1f-KZERO)
.intel_syntax

.code64
1: 
	// Long mode. Welcome to 2003.  Jump out of the identity map
	// and into the kernel address space.

	// Load a 64-bit GDT in the kernel address space.
	movabs	rax, gdtdescv
	lgdt   [rax]

	// Zero out the segment registers: they are not used in long mode.
	xor    edx,edx
	mov    ds,edx
	mov    es,edx
	mov    fs,edx
	mov    gs,edx
	mov    ss,edx

	// We can now use linked addresses for the stack and code.
	// We'll jump into the kernel from here.
	movabs rax, KZERO
	add    rsp, rax
	movabs rax, warp64
	jmp    rax

.text
.code64
warp64:
	// At this point, we are fully in the kernel virtual
	// address space and we can discard the identity mapping.
	// There is a PML4 sans identity map 4KiB beyond the
	// current PML4; load that, which also flushes the TLB.
	mov    rax, cr3
	add    rax, PTSZ
	mov    cr3, rax						// Also flushes TLB.

	// &sys->mach is the first argument to main()
	movabs rdi, KSYS
	add    rdi, 0xd1000 // MACHSTKSZ+(1+1+1+4+1+192)*PTSZ+PGSZ
	mov    rsi, rbp						// multiboot magic
	mov    rdx, rbx						// multiboot info pointer

	// Push a dummy stack frame and jump to `main`.
	push   0x0
	mov    rbp, 0x0
	lea    rax, [rip + main]
	push   rax
	push   0x2							// clear flags
	popf
	ret
	ud2

// no deposit, no return
// do not resuscitate
.globl ndnr
ndnr:
	sti
	hlt
	jmp ndnr

.section .rodata

.align 16
gdt:
// 0: Null segment
.quad	0
.quad	0x00cf9a000000ffff
.quad	0x00cf92000000ffff
.quad	0x0020980000000000		/* Long mode CS */
egdt:

.align 16
.skip 6
gdtdesc:
.word	egdt - gdt - 1
.long	gdt - KZERO

.align 16
.skip 6
gdtdescv:
.word	egdt - gdt - 1
.quad	gdt