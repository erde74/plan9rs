#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Image {
    /*
    pub r: Ref,
    pub c: *mut Chan,
    pub qid: Qid,
    pub mqid: Qid,
    pub mchan: *mut Chan,
    pub dc: ::std::os::raw::c_int,
    pub s: *mut Segment,
    pub hash: *mut Image,
    pub next: *mut Image,
    pub prev: *mut Image,
    pub notext: ::std::os::raw::c_int,
    pub color: ::std::os::raw::c_int,
    */
}

impl Image {
    pub fn new() -> Image {
        Image {}
    }
}

impl Default for Image {
    fn default() -> Self {
        Self::new()
    }
}
