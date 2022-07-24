use crate::dat::Image;
use crate::taslock::Lock;

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Page {
    pub l: Lock,
    pub pa: u64,
    pub va: usize,
    pub daddr: u32,
    pub ref_: i32,
    pub modref: u8,
    pub color: i32,
    pub cachectl: [u8; 32usize],
    pub image: *mut Image,
    pub next: *mut Page,
    pub prev: *mut Page,
    pub hash: *mut Page,
    pub pgszi: i32,
}

impl Page {
    pub fn new() -> Page {
        Page {
            l: Lock::new(),
            pa: 0,
            va: 0,
            daddr: 0,
            ref_: 0,
            modref: 0,
            color: 0,
            cachectl: [0; 32],
            image: core::ptr::null_mut::<Image>(),
            next: core::ptr::null_mut::<Page>(),
            prev: core::ptr::null_mut::<Page>(),
            hash: core::ptr::null_mut::<Page>(),
            pgszi: 0,
        }
    }
}

impl Default for Page {
    fn default() -> Self {
        Self::new()
    }
}
