#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Perf {
    pub intrts: u64,
    pub inintr: u64,
    pub avg_inintr: u64,
    pub inidle: u64,
    pub avg_inidle: u64,
    pub last: u64,
    pub period: u64,
}

impl Perf {
    pub fn new() -> Perf {
        Perf {
            intrts: 0,
            inintr: 0,
            avg_inintr: 0,
            inidle: 0,
            avg_inidle: 0,
            last: 0,
            period: 0,
        }
    }
}
