#![no_main]
#![no_std]

use core::ptr;
// use core::mem::size_of;
use core::slice::from_raw_parts_mut;

use k10::asm::ASM;
// use k10::cga::{cgainit, cgapost};
use k10::dat::{active, edata, end, m_ptr, sys_ptr, up_ptr, Mach, MACHSTKSZ};
use k10::multiboot::multiboot;
use k10::vsvm::vsvminit;
use k10::{archhz, println};

#[no_mangle]
pub fn main(_: *mut Mach, mbmagic: u32, pmbi: u32) {
    let m = unsafe { &mut *m_ptr };
    let sys = unsafe { &mut *sys_ptr };

    unsafe {
        let eptr = &edata as *const i8 as *mut u8;
        let size = &end as *const i8 as usize - &edata as *const i8 as usize;
        let mem = from_raw_parts_mut(eptr, size);
        mem.fill(0);
    }
    *m = Mach::new();

    // cgapost((size_of::<usize>() * 8) as i32);
    m.machno = 0;
    m.online = 1;
    unsafe {
        sys.ptrpage.machptr[m.machno as usize] = &mut sys.mach.mach;
    }
    m.stack = &mut sys.machstk as *mut _ as usize;
    m.vsvm = &mut sys.vsvmpage;

    sys.syspage.fields.nmach = 1;
    sys.syspage.fields.nonline = 1;
    sys.syspage.fields.copymode = 0; // COW
    unsafe {
        up_ptr = ptr::null_mut();
    }

    unsafe {
        ASM.init();
    };

    multiboot(mbmagic, pmbi, true);
    // options(oargc, oargv);
    // crapoptions();

    /*
     * Need something for initial delays
     * until a timebase is worked out.
     */
    m.cpuhz = 2_000_000_000;
    m.cpumhz = 2000;

    // cgainit();

    unsafe {
        vsvminit(MACHSTKSZ);
        active.machs = 1;
        active.exiting = 0;
    };

    println!("Plan 9");

    m.perf.period = 1;
    if let Some(hz) = archhz() {
        m.cpuhz = hz;
        m.cpumhz = (hz / 1000000) as i32;
    }

    println!("loop");
    loop {}
}
