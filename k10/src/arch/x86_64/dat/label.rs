#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Label {
    pub sp: usize,
    pub pc: usize,
}

impl Label {
    pub fn new() -> Label {
        Label { sp: 0, pc: 0 }
    }
}
