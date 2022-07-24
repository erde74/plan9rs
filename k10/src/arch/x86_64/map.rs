use crate::arch::x86_64::KZERO;
use crate::getcallerpc;

pub const fn kaddr(pa: usize) -> usize {
    if pa < KZERO {
        KZERO + pa
    } else {
        pa
    }
}

pub fn paddr(pa: usize) -> usize {
    if pa >= KZERO {
        return pa - KZERO;
    }

    panic!("PADDR pa {:X} {:X}", pa, unsafe { getcallerpc(0) as usize });
}
