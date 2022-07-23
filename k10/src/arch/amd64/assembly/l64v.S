.att_syntax
.code64

/* Rflags */
If = 0x00000200

/*
 * Synchronisation
 */
.global ainc
ainc:
	MOVL	$1, %eax
	LOCK; XADDL %eax, (%rdi)
	ADDL	$1, %eax				/* overflow if -ve or 0 */
	JG	_return
_trap:
	XORQ	%rbx, %rbx
	MOVQ	(%rbx), %rbx			/* over under sideways down */
_return:
	RET
	
.global adec
adec:
	MOVL	$-1, %eax
	LOCK; XADDL %eax, (%rdi)
	SUBL	$1, %eax				/* underflow if -ve */
	JL	_trap

	RET
	
/*
 *	disable interrupts,
 *	return old flags for splx()
 */
.global splhi
splhi:
_splhi:
	PUSHFQ
	POPQ	%rax
	TESTQ	$If, %rax	/* If - Interrupt Flag */
	JZ	_alreadyhi
	movq	0(%rsp), %rdi
	movq	%rdi, %gs:8	/* callerpc to m->splpc */
_alreadyhi:
	CLI
	RET

/*
 *	enable interrupts,
 *	return old flags for splx()
 */
.global spllo
spllo:
_spllo:
	PUSHFQ
	POPQ	%rax
	TESTQ	$If, %rax	/* If - Interrupt Flag */
	JNZ	_alreadylo
	MOVQ	$0, %gs:8	/* clear m->splpc */
_alreadylo:
	STI
	RET
		
/*
 *	undo splhi or spllo,
 *	%rdi has flags before splhi or spllo
 */
.global splx
splx:
	TESTQ	$If, %rdi	/* If - Interrupt Flag */
	JNZ	_spllo		/* If set: enable */
	JMP	_splhi		/* else: disable */

.global spldone
spldone:
	RET

/*
 * Load/store segment descriptor tables:
 *	GDT - global descriptor table
 *	IDT - interrupt descriptor table
 *	TR - task register
 * GDTR and LDTR take an m16:m64 argument,
 * so shuffle the stack arguments to
 * get it in the right format.
 */
.global gdtget
gdtget:
	// panic.
	mov 0, %rax
	//sgdt	%rdi
//	MOVL	GDTR, (RARG)			/* Note: 10 bytes returned */
	RET

// Called with the address of gdt in rdi.
// Load the gdt, then do a ret which will use the argument on the stack as
// a segment #. This stuff is just crazy.
// We have to push %rsi, then 16 bits(really!) of %rdi.
.global gdtput
gdtput:
	pushq	%rsi
	movq	%rdi, %rax
	pushw	%ax
	mov	%rsp, %rax
	lgdt	(%rax)
	popw 	%ax
	popq	%rax
	XORQ	%rax, %rax
	MOVW	%ax, %ds
	MOVW	%ax, %es
	MOVW	%ax, %fs
	MOVW	%ax, %gs
	MOVW	%ax, %ss
	POPQ	%rax
	PUSHQ	%rdx
	PUSHQ	%rax
	lretq

.global idtput
idtput:
	subq	$16, %rsp
	movq	%rsi, 8(%rsp)
	movw	%di, 6(%rsp)
	lidt	6(%rsp)
	addq	$16, %rsp
	ret

.global rdmsr
rdmsr:
	PUSHQ	%rcx
	PUSHQ	%rdx
	MOVL	%edi, %ecx

	RDMSR
						/* u64int rdmsr(u32int); */
	XCHGL	%edx, %eax				/* swap lo/hi, zero-extend */
	SHLQ	$32, %rax				/* hi<<32 */
	ORQ	%rdx, %rax				/* (hi<<32)|lo */
	POPQ	%rdx
	POPQ	%rcx
	RET
	
.global wrmsr
wrmsr:
	PUSHQ	%rax	// do we need to do this?
	PUSHQ	%rcx
	PUSHQ	%rdx
	MOVL	%edi, %ecx
	MOVL	%esi, %eax
	MOVQ	%rsi, %rdx
	SHRQ	$32, %rdx

	WRMSR

	POPQ	%rdx
	POPQ	%rcx
	POPQ	%rax
	RET
		