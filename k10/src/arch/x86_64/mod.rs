use crate::dat::{m_ptr, MiB, MACHSTKSZ, PGSZ, PTSZ};

pub const KZERO: usize = 0xffff_8000_0000_0000;
pub const KTZERO: usize = KZERO + 2 * MiB;
pub const KSYS: usize = KZERO + MiB + PGSZ;

/* Cr0 */
pub const Pe: usize = 0x00000001; /* Protected Mode Enable */
pub const Mp: usize = 0x00000002; /* Monitor Coprocessor */
pub const Em: usize = 0x00000004; /* Emulate Coprocessor */
pub const Ts: usize = 0x00000008; /* Task Switched */
pub const Et: usize = 0x00000010; /* Extension Type */
pub const Ne: usize = 0x00000020; /* Numeric Error  */
pub const Wp: usize = 0x00010000; /* Write Protect */
pub const Am: usize = 0x00040000; /* Alignment Mask */
pub const Nw: usize = 0x20000000; /* Not Writethrough */
pub const Cd: usize = 0x40000000; /* Cache Disable */
pub const Pg: usize = 0x80000000; /* Paging Enable */

/* Cr3 */
pub const Pwt: usize = 0x00000008; /* Page-Level Writethrough */
pub const Pcd: usize = 0x00000010; /* Page-Level Cache Disable */

/* Cr4 */
pub const Vme: usize = 0x00000001; /* Virtual-8086 Mode Extensions */
pub const Pvi: usize = 0x00000002; /* Protected Mode Virtual Interrupts */
pub const Tsd: usize = 0x00000004; /* Time-Stamp Disable */
pub const De: usize = 0x00000008; /* Debugging Extensions */
pub const Pse: usize = 0x00000010; /* Page-Size Extensions */
pub const Pae: usize = 0x00000020; /* Physical Address Extension */
pub const Mce: usize = 0x00000040; /* Machine Check Enable */
pub const Pge: usize = 0x00000080; /* Page-Global Enable */
pub const Pce: usize = 0x00000100; /* Performance Monitoring Counter Enable */
pub const Osfxsr: usize = 0x00000200; /* FXSAVE/FXRSTOR Support */
pub const Osxmmexcpt: usize = 0x00000400; /* Unmasked Exception Support */

/* Rflags */
pub const Cf: u32 = 0x00000001; /* Carry Flag */
pub const Pf: u32 = 0x00000004; /* Parity Flag */
pub const Af: u32 = 0x00000010; /* Auxiliary Flag */
pub const Zf: u32 = 0x00000040; /* Zero Flag */
pub const Sf: u32 = 0x00000080; /* Sign Flag */
pub const Tf: u32 = 0x00000100; /* Trap Flag */
pub const If: u32 = 0x00000200; /* Interrupt Flag */
pub const Df: u32 = 0x00000400; /* Direction Flag */
pub const Of: u32 = 0x00000800; /* Overflow Flag */
pub const Iopl0: u32 = 0x00000000; /* I/O Privilege Level */
pub const Iopl1: u32 = 0x00001000;
pub const Iopl2: u32 = 0x00002000;
pub const Iopl3: u32 = 0x00003000;
pub const Nt: u32 = 0x00004000; /* Nested Task */
pub const Rf: u32 = 0x00010000; /* Resume Flag */
pub const Vm: u32 = 0x00020000; /* Virtual-8086 Mode */
pub const Ac: u32 = 0x00040000; /* Alignment Check */
pub const Vif: u32 = 0x00080000; /* Virtual Interrupt Flag */
pub const Vip: u32 = 0x00100000; /* Virtual Interrupt Pending */
pub const Id: u32 = 0x00200000; /* ID Flag */

/* MSRs */
pub const Efer: u32 = 0xc0000080; /* Extended Feature Enable */
pub const Star: u32 = 0xc0000081; /* Legacy Target IP and [CS]S */
pub const Lstar: u32 = 0xc0000082; /* Long Mode Target IP */
pub const Cstar: u32 = 0xc0000083; /* Compatibility Target IP */
pub const Sfmask: u32 = 0xc0000084; /* SYSCALL Flags Mask */

/* Efer */
pub const Sce: u64 = 0x00000001; /* System Call Extension */
pub const Lme: u64 = 0x00000100; /* Long Mode Enable */
pub const Lma: u64 = 0x00000400; /* Long Mode Active */
pub const Nxe: u64 = 0x00000800; /* No-Execute Enable */
pub const Svme: u64 = 0x00001000; /* SVM Extension Enable */
pub const Ffxsr: u64 = 0x00004000; /* Fast FXSAVE/FXRSTOR */

/* PML4E/PDPE/PDE/PTE */
pub const PteP: usize = 0x0000000000000001; /* Present */
pub const PteRW: usize = 0x0000000000000002; /* Read/Write */
pub const PteU: usize = 0x0000000000000004; /* User/Supervisor */
pub const PtePWT: usize = 0x0000000000000008; /* Page-Level Write Through */
pub const PtePCD: usize = 0x0000000000000010; /* Page Level Cache Disable */
pub const PteA: usize = 0x0000000000000020; /* Accessed */
pub const PteD: usize = 0x0000000000000040; /* Dirty */
pub const PtePS: usize = 0x0000000000000080; /* Page Size */
pub const Pte4KPAT: usize = PtePS; /* PTE PAT */
pub const PteG: usize = 0x0000000000000100; /* Global */
pub const Pte2MPAT: usize = 0x0000000000001000; /* PDE PAT */
pub const Pte1GPAT: usize = Pte2MPAT; /* PDPE PAT */
pub const PteNX: usize = 0x8000000000000000; /* No Execute */

/* Exceptions */

pub const IdtDE: i32 = 0; /* Divide-by-Zero Error */
pub const IdtDB: i32 = 1; /* Debug */
pub const IdtNMI: i32 = 2; /* Non-Maskable-Interrupt */
pub const IdtBP: i32 = 3; /* Breakpoint */
pub const IdtOF: i32 = 4; /* Overflow */
pub const IdtBR: i32 = 5; /* Bound-Range */
pub const IdtUD: i32 = 6; /* Invalid-Opcode */
pub const IdtNM: i32 = 7; /* Device-Not-Available */
pub const IdtDF: i32 = 8; /* Double-Fault */
pub const Idt09: i32 = 9; /* unsupported */
pub const IdtTS: i32 = 10; /* Invalid-TSS */
pub const IdtNP: i32 = 11; /* Segment-Not-Present */
pub const IdtSS: i32 = 12; /* Stack */
pub const IdtGP: i32 = 13; /* General-Protection */
pub const IdtPF: i32 = 14; /* Page-Fault */
pub const Idt0F: i32 = 15; /* reserved */
pub const IdtMF: i32 = 16; /* x87 FPE-Pending */
pub const IdtAC: i32 = 17; /* Alignment-Check */
pub const IdtMC: i32 = 18; /* Machine-Check */
pub const IdtXF: i32 = 19; /* SIMD Floating-Point */

/*
 * Vestigial Segmented Virtual Memory.
 */

/* Segment Descriptor */

pub const SdISTM: u64 = 0x0000000700000000; /* Interrupt Stack Table Mask */
pub const SdA: u64 = 0x0000010000000000; /* Accessed */
pub const SdR: u64 = 0x0000020000000000; /* Readable (Code) */
pub const SdW: u64 = 0x0000020000000000; /* Writeable (Data) */
pub const SdE: u64 = 0x0000040000000000; /* Expand Down */
pub const SdaTSS: u64 = 0x0000090000000000; /* Available TSS */
pub const SdbTSS: u64 = 0x00000b0000000000; /* Busy TSS */
pub const SdCG: u64 = 0x00000c0000000000; /* Call Gate */
pub const SdIG: u64 = 0x00000e0000000000; /* Interrupt Gate */
pub const SdTG: u64 = 0x00000f0000000000; /* Trap Gate */
pub const SdCODE: u64 = 0x0000080000000000; /* Code/Data */
pub const SdS: u64 = 0x0000100000000000; /* System/User */
pub const SdDPL0: u64 = 0x0000000000000000; /* Descriptor Privilege Level */
pub const SdDPL1: u64 = 0x0000200000000000;
pub const SdDPL2: u64 = 0x0000400000000000;
pub const SdDPL3: u64 = 0x0000600000000000;
pub const SdP: u64 = 0x0000800000000000; /* Present */
pub const Sd4G: u64 = 0x000f00000000ffff; /* 4G Limit */
pub const SdL: u64 = 0x0020000000000000; /* Long Attribute */
pub const SdD: u64 = 0x0040000000000000; /* Default Operand Size */
pub const SdG: u64 = 0x0080000000000000; /* Granularity */

/* Segment Selector */

pub const SsRPL0: i32 = 0x0000; /* Requestor Privilege Level */
pub const SsRPL1: i32 = 0x0001;
pub const SsRPL2: i32 = 0x0002;
pub const SsRPL3: i32 = 0x0003;
pub const SsTIGDT: i32 = 0x0000; /* GDT Table Indicator  */
pub const SsTILDT: i32 = 0x0004; /* LDT Table Indicator */
pub const SsSIM: i32 = 0xfff8; /* Selector Index Mask */

#[macro_export]
macro_rules! ssel {
    ($si: expr, $tirpl: expr) => {
        ((($si) << 3) | ($tirpl)) /* Segment Selector */
    };
}

pub const SiNULL: i32 = 0; /* NULL selector index */
pub const SiCS: i32 = 1; /* CS selector index */
pub const SiDS: i32 = 2; /* DS selector index */
pub const SiU32CS: i32 = 3; /* User CS selector index */
pub const SiUDS: i32 = 4; /* User DS selector index */
pub const SiUCS: i32 = 5; /* User CS selector index */
pub const SiFS: i32 = 6; /* FS selector index */
pub const SiGS: i32 = 7; /* GS selector index */
pub const SiTSS: i32 = 8; /* TSS selector index */

extern "C" {
    #[link_name = "llvm.returnaddress"]
    pub fn getcallerpc(level: i32) -> *const u8;
}

extern "C" {
    pub fn ainc(a: i32) -> i32;
    pub fn adec(a: i32) -> i32;
    pub fn idthandlers();
    pub fn idtput(a: i32, b: usize);
    pub fn rdtsc() -> u64;
    pub fn splhi() -> usize;
    pub fn spllo() -> usize;
    pub fn splx(a: usize);
}

extern "C" {
    pub fn syscallentry();
}

pub fn archhz() -> Option<u64> {
    // core::todo!();
    None
}

pub fn coherence() {
    unsafe { x86::fence::mfence() }
}

/*
 *  return value and speed of timer
 */
pub fn fastticks(hz: Option<&mut u64>) -> u64 {
    let m = unsafe { &mut *m_ptr };

    if let Some(hz) = hz {
        *hz = m.cpuhz;
    }
    return unsafe { rdtsc() };
}

core::arch::global_asm!(
    include_str!("l.S"), 
    KZERO=const KZERO, 
    KSYS=const KSYS, 
    KTZERO=const KTZERO, 
    MACHSTKSZ=const MACHSTKSZ,
    MiB=const MiB, 
    PGSZ=const PGSZ,
    Efer=const Efer,
    Lme=const Lme,
    Cd=const Cd,
    Nw=const Nw,
    Ts=const Ts,
    Mp=const Mp,
    Nxe=const Nxe,
    Pe=const Pe,
    Pg=const Pg,
    Pae=const Pae,
    Pge=const Pge,
    Pse=const Pse,
    PteRW=const PteRW,
    PteP=const PteP,
    PtePS=const PtePS,
    PTSZ=const PTSZ,
    Wp=const Wp,
    options(att_syntax));

pub mod asm;
pub mod assembly;
pub use assembly::*;
pub mod cga;
pub mod dat;
pub mod edf;
pub mod fns;
pub mod map;
pub mod multiboot;
pub mod serial;
#[macro_use]
pub mod vga;
pub mod vsvm;
