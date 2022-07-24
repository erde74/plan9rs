use crate::map::kaddr;
use crate::taslock::Lock;

pub const BLACK: u8 = 0x00;
pub const BLUE: u8 = 0x01;
pub const GREEN: u8 = 0x02;
pub const CYAN: u8 = 0x03;
pub const RED: u8 = 0x04;
pub const MAGENTA: u8 = 0x05;
pub const BROWN: u8 = 0x06;
pub const GREY: u8 = 0x07;

pub const BRIGHT: u8 = 0x08;
pub const BLINKING: u8 = 0x80;

const ATTR: u8 = (BLACK << 4) | GREY; /* (background<<4)|foreground */

const INDEX: usize = 0x3d4;
const DATA: usize = INDEX + 1;
const WIDTH: usize = 80 * 2;
const HEIGHT: usize = 25;
const POSTCODELEN: usize = 2;

const CGA: usize = kaddr(0xb800 << 4);

static mut CGALOCK: Lock = Lock::new();
static mut CGAPOS: i32 = 0;
static mut CGAINITDONE: i32 = 0;

fn outb(adr: usize, b: u8) {
    let m = adr as *mut u8;
    unsafe {
        *m = b;
    }
}

fn inb(adr: usize) -> u8 {
    unsafe { *(adr as *mut u8) }
}

pub fn cgaregr(index: u8) -> u8 {
    outb(INDEX, index);
    inb(DATA) & 0xff
}

pub fn cgapost(code: i32) {
    let cga: &mut [u8; WIDTH * HEIGHT] = unsafe { &mut *(CGA as *mut [u8; WIDTH * HEIGHT]) };

    let hex: &[u8] = "0123456789ABCDEF".as_bytes();

    (*cga)[WIDTH * HEIGHT - POSTCODELEN * 2] = hex[((code >> 4) & 0x0f) as usize];
    (*cga)[WIDTH * HEIGHT - POSTCODELEN * 2 + 1] = ATTR;
    (*cga)[WIDTH * HEIGHT - POSTCODELEN * 2 + 2] = hex[(code & 0x0f) as usize];
    (*cga)[WIDTH * HEIGHT - POSTCODELEN * 2 + 3] = ATTR;
}

pub fn cgainit() {
    unsafe {
        CGALOCK.ilock();
        CGAPOS = (cgaregr(0x0e) as i32) << 8;
        CGAPOS |= cgaregr(0x0f) as i32;
        CGAPOS *= 2;
        CGAINITDONE = 1;
        CGALOCK.iunlock();
    }
}
