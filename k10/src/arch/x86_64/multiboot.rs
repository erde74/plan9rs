use core::mem::size_of;

use crate::asm::ASM;
use crate::fns::u8_to_str;
use crate::map::kaddr;
use crate::{optionsinit, print, println};

struct Mbi {
    flags: i32,
    memlower: i32,
    memupper: i32,
    bootdevice: i32,
    cmdline: i32,
    modscount: i32,
    modsaddr: i32,
    syms: [i32; 4],
    mmaplength: i32,
    mmapaddr: i32,
    driveslength: i32,
    drivesaddr: i32,
    configtable: i32,
    bootloadername: i32,
    apmtable: i32,
    vbe: [i32; 6],
}

enum Flags {
    /* flags */
    Mem = 0x00000001,            /* mem* valid */
    Bootdevice = 0x00000002,     /* bootdevice valid */
    Cmdline = 0x00000004,        /* cmdline valid */
    Mods = 0x00000008,           /* mod* valid */
    Syms = 0x00000010,           /* syms[] has a.out info */
    Elf = 0x00000020,            /* syms[] has ELF info */
    Mmap = 0x00000040,           /* mmap* valid */
    Drives = 0x00000080,         /* drives* valid */
    Configtable = 0x00000100,    /* configtable* valid */
    Bootloadername = 0x00000200, /* bootloadername* valid */
    Apmtable = 0x00000400,       /* apmtable* valid */
    Vbe = 0x00000800,            /* vbe[] valid */
}

struct Mod {
    modstart: u32,
    modend: u32,
    string: u32,
    reserved: u32,
}

struct MMap {
    size: u32,
    base: [u32; 2],
    length: [u32; 2],
    typ: u32,
}

pub fn multiboot(magic: u32, pmbi: u32, vflag: bool) -> i32 {
    if vflag {
        println!("magic {:X} pmbi {:X}", magic, pmbi);
    }

    if magic != 0x2badb002 {
        return -1;
    }

    let mbi: &mut Mbi = unsafe { &mut *(kaddr(pmbi as usize) as *mut Mbi) };

    if vflag {
        println!("flags {:X}", mbi.flags);
    }

    if mbi.flags & Flags::Cmdline as i32 != 0 {
        let p = kaddr(mbi.cmdline as usize) as *const u8;
        let optstr = u8_to_str(p);
        if vflag {
            println!("cmdline {}", optstr);
        }
        optionsinit(&optstr);
    }

    if mbi.flags & Flags::Mods as i32 != 0 {
        for i in 0..mbi.modscount {
            let mod_: &Mod = unsafe { &*(kaddr((mbi.modsaddr + i * 16) as usize) as *const Mod) };
            let s = "";

            print!(".");

            if vflag {
                println!("mod {} {} {}", mod_.modstart, mod_.modend, s);
            }
            unsafe { ASM.modinit(mod_.modstart, mod_.modend, s) };
        }
    }

    if mbi.flags & Flags::Mmap as i32 != 0 {
        let mut mmap: &MMap = unsafe { &*(kaddr(mbi.mmapaddr as usize) as *const MMap) };
        let mut n: u32 = 0;

        while n < mbi.mmaplength as u32 {
            let addr = (mmap.base[1] as usize) << 32 | mmap.base[0] as usize;
            let len = (mmap.length[1] as usize) << 32 | mmap.length[0] as usize;

            match mmap.typ {
                1 => {
                    if vflag {
                        println!("Memory")
                    }
                    unsafe { ASM.mapinit(addr, len, mmap.typ.into()) };
                }
                2 => {
                    if vflag {
                        println!("reserved")
                    }
                    unsafe { ASM.mapinit(addr, len, mmap.typ.into()) };
                }
                3 => {
                    if vflag {
                        println!("ACPI Reclaim Memory")
                    }
                    unsafe { ASM.mapinit(addr, len, mmap.typ.into()) };
                }
                4 => {
                    if vflag {
                        println!("ACPI NVS Memory")
                    }
                    unsafe { ASM.mapinit(addr, len, mmap.typ.into()) };
                }
                _ => {
                    if vflag {
                        println!("type {}", mmap.typ);
                    }
                }
            }

            if vflag {
                println!("{:X} {} {}", addr, addr + len, len);
            }

            n += mmap.size + size_of::<u32>() as u32;
            mmap = unsafe { &*(kaddr(mbi.mmapaddr as usize + n as usize) as *const MMap) };
        }
    }

    if vflag && (mbi.flags & Flags::Bootloadername as i32 != 0) {
        let p = unsafe { &*(kaddr(mbi.bootloadername as usize) as *const u8) };
        let name = u8_to_str(p);
        println!("bootloadername {}", name);
    }

    0
}
