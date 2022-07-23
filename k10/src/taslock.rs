use core::fmt;
use core::fmt::Debug;
use core::ptr;

use crate::dat::{dumpaproc, m_ptr, sys_ptr, up_ptr, Mach, Mpl, Mreg, Proc};
use crate::edf::Admitted;
use crate::tod::todget;
use crate::{adec, ainc, coherence, getcallerpc, println, splhi, splx, tas};

pub struct Lockstats {
    pub locks: usize,
    pub glare: usize,
    pub inglare: usize,
}

impl Lockstats {
    pub const fn new() -> Lockstats {
        Lockstats {
            locks: 0,
            glare: 0,
            inglare: 0,
        }
    }
}

pub static mut LOCKSTATS: Lockstats = Lockstats::new();

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Lock {
    pub key: u32,
    pub isilock: i32,
    pub plsr: Plsr,
    pub pc: *const u8,
    pub p: *mut Proc,
    pub m: *mut Mach,
}

#[repr(C)]
#[derive(Copy, Clone)]
pub union Plsr {
    pub pl: Mpl,
    pub sr: usize,
    union_align: u64,
}

impl Debug for Plsr {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{} {}", unsafe { self.pl }, unsafe { self.sr })
    }
}

impl Lock {
    pub const fn new() -> Lock {
        Lock {
            key: 0,
            isilock: 0,
            plsr: Plsr { pl: 0 },
            pc: 0 as *const u8,
            p: ptr::null_mut(),
            m: ptr::null_mut(),
        }
    }

    pub fn lookloop(&self, pc: usize) {
        let up = unsafe { &mut *up_ptr };
        let p = unsafe { &(*self.p) };

        println!("lock {:?}", &self);
        dumpaproc(up);
        if p as *const _ != ptr::null() {
            dumpaproc(p);
        }
    }

    pub fn lock(&mut self) -> i32 {
        let lstat = unsafe { &mut LOCKSTATS };
        let m = unsafe { &mut *m_ptr };
        let sys = unsafe { &mut *sys_ptr };
        let up = unsafe { &mut *up_ptr };
        let pc = unsafe { getcallerpc(0) };

        lstat.locks += 1;

        if up as *const _ != ptr::null() {
            unsafe { ainc(up.nlocks) };
        }

        if tas(&mut self.key) == 0 {
            if up as *const _ != ptr::null() {
                up.lastilock = self;
            }

            self.pc = pc;
            self.p = up;
            self.isilock = 0;
            self.m = m;
            return 0;
        }

        if up as *const _ != ptr::null() {
            unsafe { adec(up.nlocks) };
        }
        lstat.glare += 1;

        loop {
            lstat.inglare += 1;
            let mut i = 0;

            while self.key != 0 {
                if unsafe { sys.syspage.fields.nonline } < 2
                    && up as *const _ != ptr::null()
                    && up.edf != ptr::null_mut()
                    && (unsafe { (*up.edf).flags } & Admitted as u16 == 1)
                {
                    /*
                     * Priority inversion, yield on a uniprocessor; on a
                     * multiprocessor, the other processor will unlock
                     */

                    println!("inversion {:?}", &self);
                    unsafe {
                        let ticksp = 0;
                        (*up.edf).d = todget(&ticksp); /* yield to process with lock */
                    }
                }
                i += 1;
                if i > 100000000 {
                    i = 0;
                    self.lookloop(pc as usize);
                }
                if up as *const _ != ptr::null() {
                    unsafe { ainc(up.nlocks) };
                }

                if tas(&mut self.key) == 0 {
                    if up as *const _ != ptr::null() {
                        up.lastilock = self;
                    }
                }
                self.pc = pc;
                self.p = up;
                self.isilock = 0;
                self.m = m;
                return 1;
            }
            if up as *const _ != ptr::null() {
                unsafe { adec(up.nlocks) };
            }
        }
    }

    pub fn ilock(&mut self) {
        let m = unsafe { &mut *m_ptr };

        let lstat = unsafe { &mut LOCKSTATS };

        let pc = unsafe { getcallerpc(0) };
        lstat.locks += 1;

        let mut s = unsafe { splhi() };
        if tas(&mut self.key as *mut u32) != 0 {
            lstat.glare += 1;
            /*
             * Cannot also check l->pc, l->m, or l->isilock here
             * because they might just not be set yet, or
             * (for pc and m) the lock might have just been unlocked.
             */

            loop {
                lstat.inglare += 1;
                unsafe { splx(s) };

                loop {
                    if self.key == 0 {
                        break;
                    }
                }
                s = unsafe { splhi() };
                if tas(&mut self.key as *mut u32) == 0 {
                    break;
                }
            }
        }
        m.ilockdepth += 1;
        m.ilockpc = pc;
        unsafe {
            if !up_ptr.is_null() {
                (*up_ptr).lastilock = self;
            }
        }
        self.plsr.sr = s;
        self.pc = pc;

        unsafe {
            if !up_ptr.is_null() {
                self.p = up_ptr;
            } else {
                self.p = ptr::null_mut();
            }
        }

        self.isilock = 1;
        self.m = m;
    }

    pub fn unlock(&mut self) {}

    pub fn iunlock(&mut self) {
        let m = unsafe { &mut *m_ptr };
        let s: Mreg = unsafe { self.plsr.sr };

        if self.key == 0 {
            println!("iunlock: not locked: pc {:X}", unsafe {
                getcallerpc(0) as usize
            });
        }

        self.m = ptr::null_mut();
        self.key = 0;
        coherence();
        m.ilockdepth -= 1;
        unsafe {
            if up_ptr != ptr::null_mut() {
                (*up_ptr).lastilock = ptr::null_mut();
            }
            splx(s)
        }
    }
}
