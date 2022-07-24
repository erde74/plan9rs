/*
 * Vestigial Segmented Virtual Memory.
 * To do:
 *	dynamic allocation and free of descriptors;
 *	IST should perhaps point to a different handler;
 *	user-level descriptors (if not dynamic).
 */

use core::mem::size_of;

use x86::dtables::{lgdt, DescriptorTablePointer};
use x86::msr;
use x86::segmentation::{Descriptor as SegmentDescriptor, SegmentSelector};
use x86::task;
use x86::Ring;

use crate::arch::*;
use crate::dat::{m_ptr, sys_ptr, Mach, PGSZ};
use crate::ssel;

type Sd = u64;
type Ss = u16;

#[repr(C)]
#[derive(Debug, Copy, Clone)]
struct Gd {
    pub sd: Sd,
    pub hi: u64,
}

impl Gd {
    pub const fn new() -> Gd {
        Gd { sd: 0, hi: 0 }
    }
}

#[repr(C)]
#[derive(Copy, Clone)]
struct Tss {
    _0_: u32,
    rsp0: [u32; 2],
    rsp1: [u32; 2],
    rsp2: [u32; 2],
    _28_: [u32; 2],
    ist: [u32; 14],
    _92_: [u16; 5],
    iomap: u16,
}

enum Entries {
    Ngdt = 10,  /* max. entries in gdt */
    Nidt = 256, /* max. entries in idt */
}

pub type Gdt64 = [Sd; Entries::Ngdt as usize];
static mut GDT64: Gdt64 = [
    0,                                                    /* N descriptor */
    SdL | SdP | SdDPL0 | SdS | SdCODE,                    /* CS */
    SdG | SdD | SdP | SdDPL0 | SdS | SdW,                 /* DS */
    SdG | SdD | SdP | SdDPL3 | SdS | SdCODE | SdR | Sd4G, /* User CS 32-bit */
    SdG | SdD | SdP | SdDPL3 | SdS | SdW | Sd4G,          /* User DS */
    SdL | SdP | SdDPL3 | SdS | SdCODE,                    /* User CS 64-bit */
    0,                                                    /* FS */
    0,                                                    /* GS */
    0,                                                    /* TSS lower */
    0,                                                    /* TSS upper */
];

static NGDT64: i32 = 10;

type Idt64 = [Gd; Entries::Nidt as usize];
static mut IDT64: Idt64 = [Gd::new(); Entries::Nidt as usize];

fn mksd(base: u64, limit: u64, bits: u64, upper: *mut u64) -> Sd {
    let mut sd: Sd = bits;

    sd |= (((limit & 0x00000000000f0000) >> 16) << 48) | (limit & 0x000000000000ffff);
    sd |= (((base & 0x00000000ff000000) >> 24) << 56)
        | (((base & 0x0000000000ff0000) >> 16) << 32)
        | ((base & 0x000000000000ffff) << 16);
    if !upper.is_null() {
        unsafe { *upper = base >> 32 };
    }

    sd
}

fn mkgd(gd: &mut Gd, offset: *mut u8, ss: Ss, bits: u64, ist: i32) {
    let mut sd: Sd = bits;

    sd |=
        (((offset as u64 & 0x00000000ffff0000) >> 16) << 48) | (offset as u64 & 0x000000000000ffff);
    sd |= (ss as u64 & 0x000000000000ffff) << 16;
    sd |= (ist as u64 & (SdISTM >> 32)) << 32;
    gd.sd = sd;
    gd.hi = offset as u64 >> 32;
}

fn idtinit() {
    let gd = unsafe { &mut IDT64 };
    let mut offset = &mut idthandlers as *mut _ as *mut u8;

    for v in 0..Entries::Nidt as i32 {
        let mut ist = 0;
        let mut dpl = SdP | SdDPL0 | SdIG;
        match v {
            IdtBP => {
                dpl = SdP | SdDPL3 | SdIG;
            }
            IdtUD | IdtDF => {
                ist = 1;
            }
            _ => {}
        }
        mkgd(
            &mut gd[v as usize],
            offset,
            ssel!(SiCS, SsTIGDT | SsRPL0) as Ss,
            dpl,
            ist,
        );
        unsafe {
            offset = offset.add(6);
        }
    }
}

fn tssrsp0(sp: usize) {
    let m = unsafe { &mut *m_ptr };
    let tss = unsafe { &mut *(m.tss as *mut Tss) };
    tss.rsp0[0] = sp as u32;
    tss.rsp0[1] = (sp >> 32) as u32;
}

fn tssinit(mut sp: usize) {
    let m = unsafe { &mut *m_ptr };
    let tss = unsafe { &mut *(m.tss as *mut Tss) };

    tssrsp0(sp);

    sp = m.vsvm as usize + PGSZ as usize;
    for ist in (0..14).step_by(2) {
        tss.ist[ist] = sp as u32;
        tss.ist[ist + 1] = (sp >> 32) as u32;
    }
    tss.iomap = 0xdfff;
}

pub unsafe fn vsvminit(size: usize) {
    let m: &mut Mach = unsafe { &mut *m_ptr };
    let sys = unsafe { &mut *sys_ptr };

    if m.machno == 0 {
        idtinit();
    }

    m.gdt = m.vsvm as *mut _;
    (*m.gdt) = GDT64;
    m.tss = &mut (*m.vsvm)[roundup!(size_of::<Gdt64>(), 16)];

    let sd = &mut (*m.gdt)[SiTSS as usize] as *mut u64;
    *sd = mksd(
        m.tss as *mut _ as u64,
        (size_of::<Tss>() - 1) as u64,
        SdP | SdDPL0 | SdaTSS,
        sd.offset(1),
    );

    tssinit(m.stack + (size as usize));

    let limit = ((*m.gdt).len() * size_of::<Sd>() - 1)
        .try_into()
        .expect("main GDT way too large");
    let base = m.gdt as *const SegmentDescriptor;
    let gdtr: DescriptorTablePointer<SegmentDescriptor> = DescriptorTablePointer { limit, base };

    lgdt(&gdtr);

    task::load_tr(SegmentSelector::new(SiTSS as u16, Ring::Ring0));
    idtput((size_of::<Idt64>() - 1) as i32, IDT64.as_ptr() as usize);
    // lidt(&IDT64);

    msr::wrmsr(msr::IA32_FS_BASE, 0);
    msr::wrmsr(
        msr::IA32_GS_BASE,
        sys.ptrpage.machptr[m.machno as usize] as u64,
    );
    msr::wrmsr(msr::IA32_KERNEL_GSBASE, 0);

    let mut r = msr::rdmsr(msr::IA32_EFER);
    r |= Sce;
    msr::wrmsr(msr::IA32_EFER, r);
    r = (ssel!(SiU32CS, SsRPL3) as u64) << 48;
    r |= (ssel!(SiCS, SsRPL0) as u64) << 32;
    msr::wrmsr(msr::IA32_STAR, r);
    msr::wrmsr(msr::IA32_LSTAR, &syscallentry as *const _ as u64);
    msr::wrmsr(msr::IA32_FMASK, If as u64);
}
