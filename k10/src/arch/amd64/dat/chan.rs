#[repr(C)]
#[derive(Copy, Clone)]
pub struct Chan {
    /*
        pub next: *mut Chan,
        pub link: *mut Chan,
        pub offset: vlong,
        pub devoffset: vlong,
        pub dev: *mut Dev,
        pub devno: uint,
        pub mode: ushort,
        pub flag: ushort,
        pub qid: Qid,
        pub fid: ::std::os::raw::c_int,
        pub iounit: ulong,
        pub umh: *mut Mhead,
        pub umc: *mut Chan,
        pub umqlock: QLock,
        pub uri: ::std::os::raw::c_int,
        pub dri: ::std::os::raw::c_int,
        pub dirrock: *mut uchar,
        pub nrock: ::std::os::raw::c_int,
        pub mrock: ::std::os::raw::c_int,
        pub rockqlock: QLock,
        pub ismtpt: ::std::os::raw::c_int,
        pub mc: *mut Mntcache,
        pub mux: *mut Mnt,
        pub __bindgen_anon_1: Chan__bindgen_ty_1,
        pub mchan: *mut Chan,
        pub mqid: Qid,
        pub path: *mut Path,
    */
}
