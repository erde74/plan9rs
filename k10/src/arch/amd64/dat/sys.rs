use crate::dat::{Mach, Pte, KIB, MACHMAX, MACHSTKSZ, MACHSZ, PTSZ};

use core::mem::size_of;

/*
 * This is the low memory map, between 0x100000 and 0x110000.
 * It is located there to allow fundamental datastructures to be
 * created and used before knowing where free memory begins
 * (e.g. there may be modules located after the kernel BSS end).
 * The layout is known in the bootstrap code in l32p.s.
 * It is logically two parts: the per processor data structures
 * for the bootstrap processor (stack, Mach, vsvm, and page tables),
 * and the global information about the system (syspage, ptrpage).
 * Some of the elements must be aligned on page boundaries, hence
 * the unions.
 */

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Sys {
    pub machstk: [u8; MACHSTKSZ],
    pub pml4: [Pte; PTSZ / size_of::<Pte>()],
    pub pdp: [Pte; PTSZ / size_of::<Pte>()],
    pub pd: [Pte; PTSZ / size_of::<Pte>()],
    pub pt: [Pte; PTSZ / size_of::<Pte>()],
    pub vsvmpage: [u8; 4 * KIB],
    pub mach: Mach_union,
    pub syspage: Sys_union,
    pub ptrpage: Machptr_union,
    pub _57344_: [[u8; 4 * KIB]; 2usize],
}

unsafe impl Sync for Sys {}
unsafe impl Send for Sys {}

#[repr(C)]
#[derive(Copy, Clone)]
pub union Mach_union {
    pub mach: Mach,
    pub machpage: [u8; MACHSZ as usize],
    _bindgen_union_align: [u64; 512usize],
}

#[repr(C)]
#[derive(Copy, Clone)]
pub union Sys_union {
    pub fields: Sys__bindgen_ty_2__bindgen_ty_1,
    pub syspage: [u8; 4096usize],
    _bindgen_union_align: [u64; 512usize],
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Sys__bindgen_ty_2__bindgen_ty_1 {
    pub pmstart: usize,    /* physical memory */
    pub pmoccupied: usize, /* how much is occupied */
    pub pmend: usize,      /* total span */
    pub pmpaged: u64,      /* how much assigned to page pool */

    pub vmstart: usize,    /* base address for malloc */
    pub vmunused: usize,   /* 1st unused va */
    pub vmunmapped: usize, /* 1st unmapped va */
    pub vmend: usize,      /* 1st unusable va */

    pub epoch: u64,    /* crude time synchronisation */
    pub nmach: i32,    /* how many machs */
    pub nonline: i32,  /* how many machs are online */
    pub ticks: u32,    /* since boot (type?) */
    pub copymode: u32, /* 0 is COW, 1 is copy on ref */
}

#[repr(C)]
#[derive(Copy, Clone)]
pub union Machptr_union {
    pub machptr: [*mut Mach; MACHMAX],
    pub ptrpage: [u8; 4096usize],
    _bindgen_union_align: [u64; 512usize],
}
/*
impl Sys {
    pub fn new() -> Sys {
        Sys {
            machstk: [ptr::null_mut(); MACHSTKSZ as usize],
            pml4: [0; PTSZ / size_of::<Pte>()],
            pdp: [0; PTSZ / size_of::<Pte>()],
            pd: [0; PTSZ / size_of::<Pte>()],
            pt: [0; PTSZ / size_of::<Pte>()],

            vsvmpage: [0; 4 * KIB],

            mach.machpage: Mach::new(),

            syspage.fields.pmstart: 0,
            syspage.fields.pmoccupied: 0,
            syspage.fields.pmend: 0,
            syspage.fields.pmpaged: 0,

            vmstart: 0,
            vmunused: 0,
            vmunmapped: 0,
            vmend: 0,

            epoch: 0,
            nmach: 0,
            nonline: 0,
            ticks: 0,
            copymode: 0,

            machptr: [ptr::null_mut(); MACHMAX],
        }
    }
}
*/
