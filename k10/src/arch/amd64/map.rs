use crate::arch::amd64::{KSEG0, KSEG2, TMFM};

pub const fn kaddr(pa: usize) -> usize {
    if pa < TMFM {
        KSEG0 + pa
    } else {
        KSEG2 + pa
    }
}

pub fn paddr(pa: usize) -> usize {
    if (KSEG0..KSEG0 + TMFM).contains(&pa) {
        return pa - KSEG0;
    }

    if pa > KSEG2 {
        return pa - KSEG2;
    }
    0
}
