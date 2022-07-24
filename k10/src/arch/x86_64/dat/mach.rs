use crate::dat::*;
use crate::taslock::Lock;
use crate::vsvm::Gdt64;

/*
 * Per processor information.
 *
 * The offsets of the first few elements may be known
 * to low-level assembly code, so do not re-order:
 *	machno	- no dependency, convention
 *	splpc	- splhi, spllo, splx
 *	proc	- syscallentry
 */

#[derive(Debug, Copy, Clone)]
#[repr(C)]
pub struct Mach {
    pub machno: i32,  /* physical id of processor */
    pub splpc: usize, /* pc of last caller to splhi */

    pub proc: *mut Proc, /* current process on this processor */

    pub apicno: i32,
    pub online: i32,
    pub mode: i32, /* fold into online? GAK */

    pub mmmu: Mmmu,

    pub stack: usize,
    pub vsvm: *mut [u8; 4 * KIB],
    pub gdt: *mut Gdt64,
    pub tss: *mut u8,

    pub ticks: u64,      /* of the clock since boot time */
    pub sched: Label,    /* scheduler wakeup */
    pub alarmlock: Lock, /* access to alarm list */
    pub alarm: *mut u8,  /* alarms bound to this clock */
    pub inclockintr: i32,

    pub readied: *mut Proc, /* for runproc */
    pub schedticks: u64,    /* next forced context switch */

    pub color: i32,

    pub tlbfault: i32,
    pub tlbpurge: i32,
    pub pfault: i32,
    pub cs: i32,
    pub syscall: i32,
    pub load: i32,
    pub intr: i32,
    pub mmuflush: i32, /* make current proc flush it's mmu state */
    pub ilockdepth: i32,
    pub ilockpc: *const u8,
    pub perf: Perf, /* performance counters */

    pub lastintr: i32,

    pub apictimerlock: Lock,
    pub cyclefreq: u64, /* Frequency of user readable cycle counter */
    pub cpuhz: u64,
    pub cpumhz: i32,
    pub rdtsc: u64,

    mfpu: Mfpu,
    mcpu: Mcpu,
}

unsafe impl Sync for Mach {}
unsafe impl Send for Mach {}

impl Mach {
    pub fn new() -> Mach {
        Mach {
            machno: 0,
            splpc: 0,
            proc: ptr::null_mut(),
            apicno: 0,
            online: 0,
            mode: 0,

            mmmu: Mmmu::new(),

            stack: 0,
            vsvm: ptr::null_mut(),
            gdt: ptr::null_mut(),
            tss: ptr::null_mut(),

            ticks: 0,
            sched: Label::new(),
            alarmlock: Lock::new(),
            alarm: ptr::null_mut(),
            inclockintr: 0,

            readied: ptr::null_mut(),
            schedticks: 0,

            color: 0,

            tlbfault: 0,
            tlbpurge: 0,
            pfault: 0,
            cs: 0,
            syscall: 0,
            load: 0,
            intr: 0,
            mmuflush: 0,
            ilockdepth: 0,
            ilockpc: ptr::null_mut(),
            perf: Perf::new(),

            lastintr: 0,

            apictimerlock: Lock::new(),
            cyclefreq: 0,
            cpuhz: 0,
            cpumhz: 0,
            rdtsc: 0,

            mfpu: Mfpu::new(),
            mcpu: Mcpu::new(),
        }
    }
}
