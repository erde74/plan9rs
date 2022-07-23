use crate::fastticks;
use crate::taslock::Lock;

/* frequency of the tod clock */
const TODFREQ: u64 = 1_000_000_000;
const MicroFREQ: u64 = 1_000_000;

struct Tod {
    init: bool, /* true if initialized */
    cnt: u32,
    lock: Lock,
    multiplier: u64,  /* ns = off + (multiplier*ticks)>>31 */
    divider: u64,     /* ticks = (divider*(ns-off))>>31 */
    umultiplier: u64, /* µs = (µmultiplier*ticks)>>31 */
    udivider: u64,    /* ticks = (µdivider*µs)>>31 */
    hz: u64,          /* frequency of fast clock */
    last: u64,        /* last reading of fast clock */
    off: i64,         /* offset from epoch to last */
    lasttime: i64,    /* last return value from todget */
    delta: i64,       /* add 'delta' each slow clock tick from sstart to send */
    sstart: u64,      /* ... */
    send: u64,        /* ... */
}

impl Tod {
    pub const fn new() -> Tod {
        Tod {
            init: false,
            cnt: 0,
            lock: Lock::new(),
            multiplier: 0,
            divider: 0,
            umultiplier: 0,
            udivider: 0,
            hz: 0,
            last: 0,
            off: 0,
            lasttime: 0,
            delta: 0,
            sstart: 0,
            send: 0,
        }
    }

    pub fn init(&mut self) {

        if self.init {
            return;
        }
        self.lock.ilock();
        self.last = fastticks(Some(&mut self.hz));
        self.lock.iunlock();
        self.setfreq(unsafe { tod.hz });
        self.init = true;
        // addclock0link(todfix, 100);
        core::todo!();
    }

    pub fn setfreq(&mut self, f: u64) {
        if f <= 0 {
            panic!("tod.setfreq: freq {} <= 0", f)
        }
        self.lock.ilock();
        self.hz = f;

        /* calculate multiplier for time conversion */
        self.multiplier = mk64fract(TODFREQ, f);
        self.divider = mk64fract(f, TODFREQ) + 1;
        self.umultiplier = mk64fract(MicroFREQ, f);
        self.udivider = mk64fract(f, MicroFREQ) + 1;
        self.lock.iunlock();
    }
}

static mut tod: Tod = Tod::new();

/*
 *  get time of day
 */
pub fn todget(ticksp: &i64) -> i64 {
    0
}

/*
 * Make a 64 bit fixed point number that has a decimal point
 * to the left of the low order 32 bits.  This is used with
 * mul64fract for converting twixt nanoseconds and fastticks.
 *
 *	multiplier = (to<<32)/from
 */
pub fn mk64fract(to: u64, from: u64) -> u64 {
    return (to << 32) / from;
}
