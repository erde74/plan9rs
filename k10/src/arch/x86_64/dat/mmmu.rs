use crate::dat::Page;

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Mmmu {
    pub cr2: usize,
    pub pml4: *mut Page,
    pub pml4kludge: Page,
}

impl Mmmu {
    pub fn new() -> Mmmu {
        Mmmu {
            cr2: 0,
            pml4: core::ptr::null_mut::<Page>(),
            pml4kludge: Page::new(),
        }
    }
}

impl Default for Mmmu {
    fn default() -> Self {
        Self::new()
    }
}
