use crate::KSYS;
use crate::taslock::Lock;
use core::ptr;

pub type Mpl = usize;
pub type Mreg = Mpl;
pub type Pte = usize;

/*
 * The Mach structures must be available via the per-processor
 * MMU information array machptr, mainly for disambiguation and access to
 * the clock which is only maintained by the bootstrap processor (0).
 */
#[no_mangle]
pub static mut m_ptr: *mut Mach = (KSYS+ MACHSTKSZ+(1+1+1+4+1+192)*PTSZ+PGSZ) as *mut Mach ; //ptr::null_mut();

#[no_mangle]
pub static mut up_ptr: *mut Proc = ptr::null_mut();

#[no_mangle]
pub static mut sys_ptr: *mut Sys = KSYS as *mut Sys; // ptr::null_mut();

pub static mut active: Active = Active::new();

extern "C" {
    pub static etext: i8;
    pub static edata: i8;
    pub static mut end: i8;
}

impl Active {
    pub const fn new() -> Active {
        Active {
            machs: 0,
            exiting: 0,
            ispanic: 0,
            thunderbirdsarego: 0,
        }
    }
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Active {
    pub machs: u32,
    pub exiting: i32,
    pub ispanic: i32,
    pub thunderbirdsarego: i32,
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Evalue {
    pub name: *mut i8,
    pub value: *mut i8,
    pub len: i32,
    pub link: *mut Evalue,
    pub qid: Qid,
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Fastcall {
    _unused: [u8; 0],
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Egrp {
    pub ent: *mut *mut Evalue,
    pub nent: i32,
    pub ment: i32,
    pub path: u64,
    pub vers: u64,
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Fgrp {
    pub fd: *mut *mut Chan,
    pub nfd: i32,
    pub maxfd: i32,
    pub exceed: i32,
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Rgrp {
    pub rendhash: [*mut Proc; 32usize],
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Note {
    pub msg: [u8; 128usize],
    pub flag: i32,
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Mhead {
    /*
    pub lock: RWlock,
    pub from: *mut Chan,
    pub mount: *mut Mount,
    pub hash: *mut Mhead,
    */
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
struct Mcpu {
    cpuinfo: [[u32; 4]; 2], /* CPUID instruction output E[ABCD]X */
    ncpuinfos: i32,         /* number of standard entries */
    ncpuinfoe: i32,         /* number of extended entries */
    isintelcpu: i32,        /*  */
}

impl Mcpu {
    pub fn new() -> Mcpu {
        Mcpu {
            cpuinfo: [[0; 4]; 2],
            ncpuinfos: 0,
            ncpuinfoe: 0,
            isintelcpu: 0,
        }
    }
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
struct Mfpu {
    fcw: u16,       /* x87 control word */
    mxcsr: u32,     /* MMX control and status */
    mxcsrmask: u32, /* supported MMX feature bits */
}

impl Mfpu {
    pub fn new() -> Mfpu {
        Mfpu {
            fcw: 0,
            mxcsr: 0,
            mxcsrmask: 0,
        }
    }
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Qid {
    pub path: usize,
    pub vers: u64,
    pub type_: u8,
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct RWlock {
    pub use_: Lock,
    pub head: *mut Proc,
    pub tail: *mut Proc,
    pub wpc: usize,
    pub wproc: *mut Proc,
    pub readers: i32,
    pub writer: i32,
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Pgrp {
    pub noattach: i32,
    pub pgrpid: u64,
    pub debug: QLock,
    pub ns: RWlock,
    pub mnthash: [*mut Mhead; 32usize],
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Rendez {
    pub p: *mut Proc,
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Waitmsg {
    pub pid: i32,
    pub time: [u64; 3usize],
    pub msg: [u8; 128usize],
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct Waitq {
    pub w: Waitmsg,
    pub next: *mut Waitq,
}

pub mod chan;
pub use chan::*;

pub mod image;
pub use image::*;

pub mod label;
pub use label::*;

pub mod mach;
pub use mach::*;

pub mod mem;
pub use mem::*;

pub mod mmmu;
pub use mmmu::*;

pub mod page;
pub use page::*;

pub mod perf;
pub use perf::*;

pub mod proc;
pub use proc::*;

pub mod qlock;
pub use qlock::*;

pub mod segment;
pub use segment::*;

pub mod sys;
pub use sys::*;
