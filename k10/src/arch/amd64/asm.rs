use core::ptr;

use crate::dat::*;
use crate::map::paddr;
use crate::println;
use crate::taslock::Lock;

pub static mut ASM: Asm = Asm::new();

#[derive(Debug, Copy, Clone, PartialEq)]
pub enum ASMTYPE {
    None,
    Memory,
    Reserved,
    AcpiReclaim,
    AcpiInvs,
    Dev,
}

impl From<u32> for ASMTYPE {
    fn from(orig: u32) -> Self {
        match orig {
            1 => ASMTYPE::Memory,
            2 => ASMTYPE::Reserved,
            3 => ASMTYPE::AcpiReclaim,
            4 => ASMTYPE::AcpiInvs,
            5 => ASMTYPE::Dev,
            _ => ASMTYPE::None,
        }
    }
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct AsmList {
    head: *mut AsmNode,
}

impl AsmList {
    pub const fn new() -> AsmList {
        AsmList {
            head: ptr::null_mut(),
        }
    }

    pub fn iter(&self) -> Iter {
        Iter {
            next: unsafe { self.head.as_ref() },
        }
    }

    pub fn iter_mut(&self) -> IterMut {
        IterMut {
            next: unsafe { self.head.as_mut() },
        }
    }

    pub fn front(&self) -> Option<&mut AsmNode> {
        unsafe { self.head.as_mut() }
    }
}

pub struct Iter<'a> {
    next: Option<&'a AsmNode>,
}

impl<'a> Iterator for Iter<'a> {
    type Item = &'a AsmNode;
    fn next(&mut self) -> Option<Self::Item> {
        self.next.take().map(|node| {
            self.next = unsafe { (*node).next.as_ref() };
            node
        })
    }
}

pub struct IterMut<'a> {
    next: Option<&'a mut AsmNode>,
}

impl<'a> Iterator for IterMut<'a> {
    type Item = &'a mut AsmNode;
    fn next(&mut self) -> Option<Self::Item> {
        self.next.take().map(|node| {
            self.next = unsafe { (*node).next.as_mut() };
            node
        })
    }
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct AsmNode {
    pub addr: usize,
    pub size: usize,
    pub typ: ASMTYPE,
    pub location: i32,
    pub next: *mut AsmNode,
    pub base: usize,
    pub limit: usize,
    pub kbase: usize, // uintptr
}

impl AsmNode {
    pub const fn new() -> AsmNode {
        AsmNode {
            addr: 0,
            size: !0,
            typ: ASMTYPE::None,
            location: 0,
            next: ptr::null_mut(),
            base: 0,
            limit: 0,
            kbase: 0,
        }
    }
}

pub struct Asm {
    lock: Lock,
    index: usize,
    list: AsmList,
    array: [AsmNode; 64],
    freelist: *mut AsmNode,
}

impl Asm {
    const fn new() -> Asm {
        Asm {
            lock: Lock::new(),
            index: 0,
            list: AsmList::new(),
            array: [AsmNode::new(); 64],
            freelist: ptr::null_mut(),
        }
    }

    pub unsafe fn dump(&mut self) {
        println!("asm index {}", self.index);

        for asm in ASM.list.iter() {
            println!(
                "{:X} {:X} {:?} {}",
                asm.addr,
                asm.addr + asm.size,
                asm.typ,
                asm.size,
            );
        }
    }

    pub unsafe fn init(&mut self) {
        let sys = unsafe { &mut *sys_ptr };

        sys.syspage.fields.pmstart = roundup!(paddr(&end as *const i8 as usize), PGSZ);
        sys.syspage.fields.pmend = sys.syspage.fields.pmstart;

        self.list.head = &mut self.array[0];
        self.index = 1;

        self.alloc(0, sys.syspage.fields.pmstart, ASMTYPE::None, 0);
    }

    pub unsafe fn new_asm(&mut self, addr: usize, size: usize, typ: ASMTYPE) -> *mut AsmNode {
        let mut asm: &mut AsmNode;

        match self.freelist.as_mut() {
            Some(a) => unsafe {
                asm = &mut *a;
                self.freelist = asm.next;
                asm.next = ptr::null_mut();
            },
            None => unsafe {
                if self.index >= self.array.len() {
                    return ptr::null_mut();
                }
                asm = &mut self.array[self.index];
                self.index += 1;
            },
        }
        asm.addr = addr;
        asm.size = size;
        asm.typ = typ;

        asm
    }

    pub unsafe fn free(&mut self, addr: usize, size: usize, typ: ASMTYPE) -> i32 {
        if size == 0 {
            return 0;
        }

        self.lock.lock();

        let mut pp: *mut AsmNode = ptr::null_mut();
        let mut ppp: &mut *mut AsmNode = &mut ASM.list.head;
        let mut np: *mut AsmNode = ASM.list.head;

        /*
         * Find either a map entry with an address greater
         * than that being returned, or the end of the map.
         */
        for asm in ASM.list.iter_mut() {
            if asm.addr > addr {
                break;
            }
            pp = asm;
            np = asm.next;
            ppp = &mut asm.next;
        }

        if (!pp.is_null() && (*pp).addr + (*pp).size > addr)
            || (!np.is_null() && addr + size > (*np).addr)
        {
            println!("asmfree: overlapp {} {:X} {:?}", size, addr, typ);
            self.lock.unlock();
            return -1;
        }

        if !pp.is_null() && (*pp).typ == typ && (*pp).addr + (*pp).size == addr {
            (*pp).size += size;

            if !np.is_null() && (*np).typ == typ && addr + size == (*np).addr {
                (*pp).size += (*np).size;
                (*pp).next = (*np).next;

                (*np).next = self.freelist;
                self.freelist = np;
            }

            self.lock.unlock();
            return 0;
        }

        if !np.is_null() && (*np).typ == typ && addr + size == (*np).addr {
            (*np).addr -= size;
            (*np).size += size;

            self.lock.unlock();
            return 0;
        }

        pp = self.new_asm(addr, size, typ);
        if pp.is_null() {
            self.lock.unlock();
            return -1;
        }

        *ppp = pp;
        (*pp).next = np;

        self.lock.unlock();
        0
    }

    pub unsafe fn alloc(&mut self, addr: usize, size: usize, typ: ASMTYPE, align: usize) -> usize {
        self.lock.lock();

        let mut pp: *mut AsmNode = ptr::null_mut();

        for asm in ASM.list.iter_mut() {
            if asm.typ != typ {
                pp = asm;
                continue;
            }
            let mut a = asm.addr;
            if addr != 0 {
                /*
                 * A specific address range has been given:
                 *   if the current map entry is greater then
                 *   the address is not in the map;
                 *   if the current map entry does not overlap
                 *   the beginning of the requested range then
                 *   continue on to the next map entry;
                 *   if the current map entry does not entirely
                 *   contain the requested range then the range
                 *   is not in the map.
                 * The comparisons are strange to prevent
                 * overflow.
                 */

                if a > addr {
                    break;
                }
                if asm.size < addr - a {
                    pp = asm;
                    continue;
                }
                if addr - a > asm.size - size {
                    break;
                }
                a = addr;
            }

            if align > 0 {
                a = ((a + align - 1) / align) * align;
            }
            if asm.addr + asm.size - a < size {
                pp = asm;
                continue;
            }

            let o = asm.addr;
            asm.addr = a + size;
            asm.size -= a - o + size;

            if asm.size == 0 {
                if let Some(next) = pp.as_mut() {
                    (*next).next = asm.next;
                }
                asm.next = self.freelist;
                self.freelist = asm;
            }

            self.lock.unlock();
            if o != a {
                self.free(o, a - o, typ);
            }
            return a;
        }
        self.lock.unlock();
        0
    }

    pub unsafe fn insert(&mut self, addr: usize, size: usize, typ: ASMTYPE) {
        if typ == ASMTYPE::None || self.alloc(addr, size, ASMTYPE::None, 0) == 0 {
            return;
        }

        if self.free(addr, size, typ) == 0 {
            return;
        }

        self.free(addr, size, ASMTYPE::None);
    }

    /*
     * Notes:
     * asmmapinit and asmmodinit called from multiboot;
     * subject to change; the numerology here is probably suspect.
     * Multiboot defines the alignment of modules as 4096.
     */
    pub unsafe fn mapinit(&mut self, mut addr: usize, mut size: usize, typ: ASMTYPE) {
        let sys = unsafe { &mut *sys_ptr };

        match typ {
            ASMTYPE::Memory => {
                /*
                 * Adjust things for the peculiarities of this
                 * architecture.
                 * Sys->pmend is the largest physical memory address found,
                 * there may be gaps between it and sys->pmstart, the range
                 * and how much of it is occupied, might need to be known
                 * for setting up allocators later.
                 */

                if addr < 1 * MiB || addr + size < sys.syspage.fields.pmstart {
                    return;
                }

                if addr < sys.syspage.fields.pmstart {
                    size -= sys.syspage.fields.pmstart - addr;
                    addr = sys.syspage.fields.pmstart;
                }
                self.insert(addr, size, typ);
                sys.syspage.fields.pmoccupied += size;

                if addr + size > sys.syspage.fields.pmend {
                    sys.syspage.fields.pmend = addr + size;
                }
            }
            _ => {
                self.insert(addr, size, typ);
            }
        }
    }

    pub unsafe fn modinit(&mut self, _start: u32, _end_: u32, _s: &str) {
        todo!();
    }

    pub unsafe fn smwalkalloc(_size: usize) -> usize {
        todo!();
    }

    pub unsafe fn meminit() {
        todo!();
    }

    pub unsafe fn umeminit() {
        todo!();
    }
}
