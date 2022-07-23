use crate::dat::Proc;

pub const Maxsteps: u64 = 200 * 100 * 2; /* 100 periods of 200 procs */

/* Edf.flags field */
pub const Admitted: u64 = 1;
pub const Sporadic: u64 = 2;
pub const Yieldonblock: u64 = 4;
pub const Sendnotes: u64 = 8;
pub const Deadline: u64 = 16;
pub const Yield: u64 = 32;
pub const Extratime: u64 = 64;
pub const Infinity: u64 = !0u64;

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Edf {
    pub D: i64,
    pub delta: i64,
    pub T: i64,
    pub C: i64,
    pub S: i64,
    pub r: i64,
    pub d: i64,
    pub t: i64,
    pub s: i64,
    pub testDelta: i64,
    pub testtype: i32,
    pub testtime: i64,
    pub testnext: *mut Proc,
    pub flags: u16,
    pub edfused: i64,
    pub extraused: i64,
    pub aged: i64,
    pub periods: u64,
    pub missed: u64,
}
