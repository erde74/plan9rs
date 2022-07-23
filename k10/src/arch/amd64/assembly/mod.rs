use core::arch::{asm, global_asm};

// global_asm!(include_str!("boot.S"));
global_asm!(include_str!("l64v.S"));
// global_asm!(include_str!("l64idt.S"));

pub fn tas(addr: *mut u32) -> u32 {
    let mut ret: u32 = 0xdeaddead;
    unsafe {
        asm!("xchg [{0}], {1:r}", in(reg) addr, inout(reg) ret);
    }
    ret
}

/*
pub fn trput(flag: usize) {
    unsafe { asm!("ltr di") }
}
*/
