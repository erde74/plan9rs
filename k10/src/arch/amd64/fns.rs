pub fn u8_to_str<'a>(p: *const u8) -> &'a str {
    let mut len = 0;
    loop {
        if unsafe { *p.offset(len) } == 0 {
            break;
        }
        len += 1;
    }
    let slice = unsafe { core::slice::from_raw_parts(p, len as usize) };
    core::str::from_utf8(slice).unwrap()
}
