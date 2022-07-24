use crate::dat::Proc;
use crate::taslock::Lock;

#[repr(C)]
#[derive(Copy, Clone)]
pub struct QLock {
    pub use_: Lock,
    pub head: *mut Proc,
    pub tail: *mut Proc,
    pub locked: i32,
    pub qpc: usize,
}
