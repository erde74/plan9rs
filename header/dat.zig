pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const ushort = c_ushort;
pub const uchar = u8;
pub const ulong = c_ulong;
pub const uint = c_uint;
pub const schar = i8;
pub const vlong = c_longlong;
pub const uvlong = c_ulonglong;
pub const uintptr = c_ulonglong;
pub const @"usize" = c_ulong;
pub const Rune = uint;
const struct_unnamed_1 = extern struct {
    lo: uint,
    hi: uint,
};
pub const union_FPdbleword = extern union {
    x: f64,
    unnamed_0: struct_unnamed_1,
};
pub const FPdbleword = union_FPdbleword;
pub const jmp_buf = [2]uintptr;
pub const mpdigit = c_uint;
pub const u8int = u8;
pub const u16int = c_ushort;
pub const u32int = c_uint;
pub const u64int = c_ulonglong;
pub const va_list = [*c]u8;
pub extern fn memccpy(?*anyopaque, ?*anyopaque, c_int, ulong) ?*anyopaque;
pub extern fn memset(?*anyopaque, c_int, c_ulong) ?*anyopaque;
pub extern fn memcmp(?*anyopaque, ?*anyopaque, ulong) c_int;
pub extern fn memmove(?*anyopaque, ?*anyopaque, ulong) ?*anyopaque;
pub extern fn memchr(?*anyopaque, c_int, ulong) ?*anyopaque;
pub extern fn strcat([*c]u8, [*c]u8) [*c]u8;
pub extern fn strchr([*c]u8, c_int) [*c]u8;
pub extern fn strcmp([*c]u8, [*c]u8) c_int;
pub extern fn strcpy([*c]u8, [*c]u8) [*c]u8;
pub extern fn strecpy([*c]u8, [*c]u8, [*c]u8) [*c]u8;
pub extern fn strncat([*c]u8, [*c]u8, c_long) [*c]u8;
pub extern fn strncpy([*c]u8, [*c]u8, c_long) [*c]u8;
pub extern fn strncmp([*c]u8, [*c]u8, c_long) c_int;
pub extern fn strrchr([*c]u8, c_int) [*c]u8;
pub extern fn strlen([*c]u8) c_long;
pub extern fn strstr([*c]u8, [*c]u8) [*c]u8;
pub extern fn cistrncmp([*c]u8, [*c]u8, c_int) c_int;
pub extern fn cistrcmp([*c]u8, [*c]u8) c_int;
pub extern fn tokenize([*c]u8, [*c][*c]u8, c_int) c_int;
pub const UTFmax: c_int = 4;
pub const Runesync: c_int = 128;
pub const Runeself: c_int = 128;
pub const Runeerror: c_int = 65533;
pub const Runemax: c_int = 1114111;
pub const Runemask: c_int = 2097151;
const enum_unnamed_2 = c_uint;
pub extern fn runetochar([*c]u8, [*c]Rune) c_int;
pub extern fn chartorune([*c]Rune, [*c]u8) c_int;
pub extern fn runelen(c_long) c_int;
pub extern fn fullrune([*c]u8, c_int) c_int;
pub extern fn utflen([*c]u8) c_int;
pub extern fn utfnlen([*c]u8, c_long) c_int;
pub extern fn utfrune([*c]u8, c_long) [*c]u8;
pub extern fn malloc(c_ulong) ?*anyopaque;
pub extern fn mallocz(ulong, c_int) ?*anyopaque;
pub extern fn free(?*anyopaque) void;
pub extern fn mallocalign(ulong, ulong, c_long, ulong) ?*anyopaque;
pub extern fn realloc(?*anyopaque, c_ulong) ?*anyopaque;
pub extern fn setmalloctag(?*anyopaque, ulong) void;
pub extern fn setrealloctag(?*anyopaque, ulong) void;
pub extern fn getmalloctag(?*anyopaque) ulong;
pub extern fn getrealloctag(?*anyopaque) ulong;
pub const Fmt = struct_Fmt;
pub const struct_Fmt = extern struct {
    runes: uchar,
    start: ?*anyopaque,
    to: ?*anyopaque,
    stop: ?*anyopaque,
    flush: ?fn ([*c]Fmt) callconv(.C) c_int,
    farg: ?*anyopaque,
    nfmt: c_int,
    args: va_list,
    r: c_int,
    width: c_int,
    prec: c_int,
    flags: ulong,
};
pub const FmtWidth: c_int = 1;
pub const FmtLeft: c_int = 2;
pub const FmtPrec: c_int = 4;
pub const FmtSharp: c_int = 8;
pub const FmtSpace: c_int = 16;
pub const FmtSign: c_int = 32;
pub const FmtZero: c_int = 64;
pub const FmtUnsigned: c_int = 128;
pub const FmtShort: c_int = 256;
pub const FmtLong: c_int = 512;
pub const FmtVLong: c_int = 1024;
pub const FmtComma: c_int = 2048;
pub const FmtByte: c_int = 4096;
pub const FmtFlag: c_int = 8192;
const enum_unnamed_3 = c_uint;
pub extern fn print([*c]u8, ...) c_int;
pub extern fn seprint([*c]u8, [*c]u8, [*c]u8, ...) [*c]u8;
pub extern fn vseprint([*c]u8, [*c]u8, [*c]u8, va_list) [*c]u8;
pub extern fn snprint([*c]u8, c_int, [*c]u8, ...) c_int;
pub extern fn vsnprint([*c]u8, c_int, [*c]u8, va_list) c_int;
pub extern fn sprint([*c]u8, [*c]u8, ...) c_int;
pub extern fn fmtinstall(c_int, ?fn ([*c]Fmt) callconv(.C) c_int) c_int;
pub extern fn fmtprint([*c]Fmt, [*c]u8, ...) c_int;
pub extern fn fmtstrcpy([*c]Fmt, [*c]u8) c_int;
pub extern fn fmtstrflush([*c]Fmt) [*c]u8;
pub extern fn fmtstrinit([*c]Fmt) c_int;
pub extern fn quotefmtinstall() void;
pub extern fn cycles([*c]uvlong) void;
pub extern fn abs(c_int) c_int;
pub extern fn atoi([*c]u8) c_int;
pub extern fn cleanname([*c]u8) [*c]u8;
pub extern fn dec64([*c]uchar, c_int, [*c]u8, c_int) c_int;
pub extern fn getcallerpc(?*anyopaque) uintptr;
pub extern fn getfields([*c]u8, [*c][*c]u8, c_int, c_int, [*c]u8) c_int;
pub extern fn gettokens([*c]u8, [*c][*c]u8, c_int, [*c]u8) c_int;
pub extern fn qsort(?*anyopaque, c_long, c_long, ?fn (?*anyopaque, ?*anyopaque) callconv(.C) c_int) void;
pub extern fn strtol([*c]u8, [*c][*c]u8, c_int) c_long;
pub extern fn strtoul([*c]u8, [*c][*c]u8, c_int) ulong;
pub extern fn strtoll([*c]u8, [*c][*c]u8, c_int) vlong;
pub extern fn strtoull([*c]u8, [*c][*c]u8, c_int) uvlong;
pub const struct_Qid = extern struct {
    path: uvlong,
    vers: ulong,
    type: uchar,
};
pub const Qid = struct_Qid;
pub const struct_Dir = extern struct {
    type: ushort,
    dev: uint,
    qid: Qid,
    mode: ulong,
    atime: ulong,
    mtime: ulong,
    length: vlong,
    name: [*c]u8,
    uid: [*c]u8,
    gid: [*c]u8,
    muid: [*c]u8,
};
pub const Dir = struct_Dir;
pub const struct_OWaitmsg = extern struct {
    pid: [12]u8,
    time: [36]u8,
    msg: [64]u8,
};
pub const OWaitmsg = struct_OWaitmsg;
pub const struct_Waitmsg = extern struct {
    pid: c_int,
    time: [3]ulong,
    msg: [128]u8,
};
pub const Waitmsg = struct_Waitmsg;
pub extern var etext: [*c]u8;
pub extern var edata: [*c]u8;
pub extern var end: [*c]u8;
pub const uintmem = u64int;
pub const Asm = struct_Asm;
pub const struct_Asm = extern struct {
    addr: uintmem,
    size: uintmem,
    type: c_int,
    location: c_int,
    next: [*c]Asm,
    base: uintmem,
    limit: uintmem,
    kbase: uintptr,
};
pub const struct_Fxsave = extern struct {
    fcw: u16int,
    fsw: u16int,
    ftw: u8int,
    zero: u8int,
    fop: u16int,
    rip: u64int,
    rdp: u64int,
    mxcsr: u32int,
    mxcsrmask: u32int,
    st: [128]uchar,
    xmm: [256]uchar,
    ign: [96]uchar,
};
pub const Fxsave = struct_Fxsave;
pub const struct_ISAConf = extern struct {
    type: [*c]u8,
    port: uintptr,
    irq: c_int,
    dma: ulong,
    mem: uintptr,
    size: @"usize",
    freq: ulong,
    nopt: c_int,
    opt: [8][*c]u8,
};
pub const ISAConf = struct_ISAConf;
pub const struct_Label = extern struct {
    sp: uintptr,
    pc: uintptr,
};
pub const Label = struct_Label;
pub const Mpl = u64int;
pub const Mreg = Mpl;
const union_unnamed_4 = extern union {
    pl: Mpl,
    sr: Mreg,
};
pub const Lock = struct_Lock;
pub const struct_Perf = extern struct {
    intrts: ulong,
    inintr: ulong,
    avg_inintr: ulong,
    inidle: ulong,
    avg_inidle: ulong,
    last: ulong,
    period: ulong,
};
pub const Perf = struct_Perf;
pub const struct_Mach = extern struct {
    machno: c_int,
    splpc: uintptr,
    proc: [*c]Proc,
    apicno: c_int,
    online: c_int,
    mode: c_int,
    stack: uintptr,
    vsvm: [*c]uchar,
    gdt: ?*anyopaque,
    tss: ?*anyopaque,
    ticks: ulong,
    sched: Label,
    alarmlock: Lock,
    alarm: ?*anyopaque,
    inclockintr: c_int,
    readied: [*c]Proc,
    schedticks: ulong,
    color: c_int,
    tlbfault: c_int,
    tlbpurge: c_int,
    pfault: c_int,
    cs: c_int,
    syscall: c_int,
    load: c_int,
    intr: c_int,
    mmuflush: c_int,
    ilockdepth: c_int,
    ilockpc: uintptr,
    perf: Perf,
    lastintr: c_int,
    apictimerlock: Lock,
    cyclefreq: uvlong,
    cpuhz: vlong,
    cpumhz: c_int,
    rdtsc: u64int,
};
pub const Mach = struct_Mach;
pub const struct_QLock = extern struct {
    use: Lock,
    head: [*c]Proc,
    tail: [*c]Proc,
    locked: c_int,
    qpc: uintptr,
};
pub const QLock = struct_QLock;
pub const struct_Walkqid = extern struct {
    clone: [*c]Chan,
    nqid: c_int,
    qid: [1]Qid,
};
pub const Walkqid = struct_Walkqid;
pub const struct_Block = extern struct {
    next: [*c]Block,
    list: [*c]Block,
    rp: [*c]uchar,
    wp: [*c]uchar,
    lim: [*c]uchar,
    base: [*c]uchar,
    free: ?fn ([*c]Block) callconv(.C) void,
    flag: ushort,
    checksum: ushort,
    magic: ulong,
};
pub const Block = struct_Block;
pub const struct_DevConf = opaque {};
pub const DevConf = struct_DevConf;
pub const struct_Dev = extern struct {
    dc: c_int,
    name: [*c]u8,
    reset: ?fn () callconv(.C) void,
    init: ?fn () callconv(.C) void,
    shutdown: ?fn () callconv(.C) void,
    attach: ?fn ([*c]u8) callconv(.C) [*c]Chan,
    walk: ?fn ([*c]Chan, [*c]Chan, [*c][*c]u8, c_int) callconv(.C) [*c]Walkqid,
    stat: ?fn ([*c]Chan, [*c]uchar, c_long) callconv(.C) c_long,
    open: ?fn ([*c]Chan, c_int) callconv(.C) [*c]Chan,
    create: ?fn ([*c]Chan, [*c]u8, c_int, c_int) callconv(.C) void,
    close: ?fn ([*c]Chan) callconv(.C) void,
    read: ?fn ([*c]Chan, ?*anyopaque, c_long, vlong) callconv(.C) c_long,
    bread: ?fn ([*c]Chan, c_long, vlong) callconv(.C) [*c]Block,
    write: ?fn ([*c]Chan, ?*anyopaque, c_long, vlong) callconv(.C) c_long,
    bwrite: ?fn ([*c]Chan, [*c]Block, vlong) callconv(.C) c_long,
    remove: ?fn ([*c]Chan) callconv(.C) void,
    wstat: ?fn ([*c]Chan, [*c]uchar, c_long) callconv(.C) c_long,
    power: ?fn (c_int) callconv(.C) void,
    config: ?fn (c_int, [*c]u8, ?*DevConf) callconv(.C) c_int,
};
pub const Dev = struct_Dev;
pub const struct_RWlock = extern struct {
    use: Lock,
    head: [*c]Proc,
    tail: [*c]Proc,
    wpc: uintptr,
    wproc: [*c]Proc,
    readers: c_int,
    writer: c_int,
};
pub const RWlock = struct_RWlock;
pub const struct_Mount = extern struct {
    mountid: c_int,
    next: [*c]Mount,
    head: [*c]Mhead,
    copy: [*c]Mount,
    order: [*c]Mount,
    to: [*c]Chan,
    mflag: c_int,
    spec: [*c]u8,
};
pub const Mount = struct_Mount;
pub const struct_Mhead = extern struct {
    lock: RWlock,
    from: [*c]Chan,
    mount: [*c]Mount,
    hash: [*c]Mhead,
};
pub const Mhead = struct_Mhead;
pub const struct_Mntcache = opaque {};
pub const Mntcache = struct_Mntcache;
pub const struct_Mntrpc = opaque {};
pub const Mntrpc = struct_Mntrpc;
pub const struct_Queue = opaque {};
pub const Queue = struct_Queue;
pub const struct_Mnt = extern struct {
    c: [*c]Chan,
    rip: [*c]Proc,
    queue: ?*Mntrpc,
    id: uint,
    list: [*c]Mnt,
    flags: c_int,
    msize: c_int,
    version: [*c]u8,
    q: ?*Queue,
};
pub const Mnt = struct_Mnt;
const union_unnamed_5 = extern union {
    aux: ?*anyopaque,
    pgrpid: Qid,
    mid: ulong,
};
pub const struct_Path = extern struct {
    s: [*c]u8,
    mtpt: [*c][*c]Chan,
    len: c_int,
    alen: c_int,
    mlen: c_int,
    malen: c_int,
};
pub const Path = struct_Path;
pub const struct_Chan = extern struct {
    next: [*c]Chan,
    link: [*c]Chan,
    offset: vlong,
    devoffset: vlong,
    dev: [*c]Dev,
    devno: uint,
    mode: ushort,
    flag: ushort,
    qid: Qid,
    fid: c_int,
    iounit: ulong,
    umh: [*c]Mhead,
    umc: [*c]Chan,
    umqlock: QLock,
    uri: c_int,
    dri: c_int,
    dirrock: [*c]uchar,
    nrock: c_int,
    mrock: c_int,
    rockqlock: QLock,
    ismtpt: c_int,
    mc: ?*Mntcache,
    mux: [*c]Mnt,
    unnamed_0: union_unnamed_5,
    mchan: [*c]Chan,
    mqid: Qid,
    path: [*c]Path,
};
pub const Chan = struct_Chan;
pub const struct_Image = extern struct {
    c: [*c]Chan,
    qid: Qid,
    mqid: Qid,
    mchan: [*c]Chan,
    dc: c_int,
    s: [*c]Segment,
    hash: [*c]Image,
    next: [*c]Image,
    notext: c_int,
    color: c_int,
};
pub const Image = struct_Image;
pub const struct_Page = extern struct {
    pa: uintptr,
    va: uintptr,
    daddr: ulong,
    ref: c_int,
    modref: uchar,
    color: uchar,
    lg2size: uchar,
    cachectl: [32]u8,
    image: [*c]Image,
    next: [*c]Page,
    prev: [*c]Page,
    hash: [*c]Page,
};
pub const Page = struct_Page;
pub const struct_Physseg = extern struct {
    attr: ulong,
    name: [*c]u8,
    pa: uintptr,
    size: @"usize",
    pgalloc: ?fn ([*c]Segment, uintptr) callconv(.C) [*c]Page,
    pgfree: ?fn ([*c]Page) callconv(.C) void,
    lg2pgsize: uchar,
};
pub const Physseg = struct_Physseg;
pub const struct_Pte = extern struct {
    pages: [256][*c]Page,
    first: [*c][*c]Page,
    last: [*c][*c]Page,
};
pub const Pte = struct_Pte;
pub const struct_Sema = extern struct {
    addr: [*c]c_int,
    waiting: c_int,
    next: [*c]Sema,
    prev: [*c]Sema,
};
pub const Sema = struct_Sema;
pub const struct_Segment = extern struct {
    lk: QLock,
    steal: ushort,
    type: ushort,
    color: c_int,
    base: uintptr,
    top: uintptr,
    size: @"usize",
    fstart: ulong,
    flen: ulong,
    lg2pgsize: uchar,
    flushme: c_int,
    image: [*c]Image,
    pseg: [*c]Physseg,
    profile: [*c]ulong,
    ptemapmem: uintptr,
    map: [*c][*c]Pte,
    mapsize: c_int,
    ssegmap: [16][*c]Pte,
    semalock: Lock,
    sema: Sema,
};
pub const Segment = struct_Segment;
pub const struct_Waitq = extern struct {
    w: Waitmsg,
    next: [*c]Waitq,
};
pub const Waitq = struct_Waitq;
pub const struct_Rendez = extern struct {
    p: [*c]Proc,
};
pub const Rendez = struct_Rendez;
pub const struct_Pgrp = extern struct {
    noattach: c_int,
    pgrpid: ulong,
    debug: QLock,
    ns: RWlock,
    mnthash: [32][*c]Mhead,
};
pub const Pgrp = struct_Pgrp;
pub const struct_Evalue = extern struct {
    name: [*c]u8,
    value: [*c]u8,
    len: c_int,
    link: [*c]Evalue,
    qid: Qid,
};
pub const Evalue = struct_Evalue;
pub const struct_Egrp = extern struct {
    ent: [*c][*c]Evalue,
    nent: c_int,
    ment: c_int,
    path: ulong,
    vers: ulong,
};
pub const Egrp = struct_Egrp;
pub const struct_Fgrp = extern struct {
    fd: [*c][*c]Chan,
    nfd: c_int,
    maxfd: c_int,
    exceed: c_int,
};
pub const Fgrp = struct_Fgrp;
pub const struct_Rgrp = extern struct {
    rendhash: [32][*c]Proc,
};
pub const Rgrp = struct_Rgrp;
pub const struct_Note = extern struct {
    msg: [128]u8,
    flag: c_int,
};
pub const Note = struct_Note;
pub const struct_Edf = opaque {};
pub const Edf = struct_Edf;
pub const struct_Fastcall = opaque {};
pub const Fastcall = struct_Fastcall;
pub const struct_Proc = extern struct {
    sched: Label,
    kstack: [*c]u8,
    mach: [*c]Mach,
    text: [*c]u8,
    user: [*c]u8,
    args: [*c]u8,
    nargs: c_int,
    rnext: [*c]Proc,
    qnext: [*c]Proc,
    qlock: [*c]QLock,
    state: c_int,
    psstate: [*c]u8,
    seg: [10][*c]Segment,
    seglock: QLock,
    pid: c_int,
    index: c_int,
    ref: c_int,
    noteid: c_int,
    pidhash: [*c]Proc,
    exl: Lock,
    waitq: [*c]Waitq,
    nchild: c_int,
    nwait: c_int,
    qwaitr: QLock,
    waitr: Rendez,
    parent: [*c]Proc,
    pgrp: [*c]Pgrp,
    egrp: [*c]Egrp,
    fgrp: [*c]Fgrp,
    rgrp: [*c]Rgrp,
    closingfgrp: [*c]Fgrp,
    parentpid: c_int,
    time: [6]ulong,
    kentry: uvlong,
    pcycles: vlong,
    insyscall: c_int,
    debug: QLock,
    pdbg: [*c]Proc,
    procmode: ulong,
    privatemem: ulong,
    hang: c_int,
    procctl: c_int,
    pc: uintptr,
    rlock: Lock,
    r: [*c]Rendez,
    sleep: Rendez,
    notepending: c_int,
    kp: c_int,
    palarm: [*c]Proc,
    alarm: ulong,
    newtlb: c_int,
    rendtag: uintptr,
    rendval: uintptr,
    rendhash: [*c]Proc,
    trend: [*c]Rendez,
    tfn: ?fn (?*anyopaque) callconv(.C) c_int,
    kpfun: ?fn (?*anyopaque) callconv(.C) void,
    kparg: ?*anyopaque,
    scallnr: c_int,
    arg: [40]uchar,
    nerrlab: c_int,
    errlab: [64]Label,
    syserrstr: [*c]u8,
    errstr: [*c]u8,
    errbuf0: [128]u8,
    errbuf1: [128]u8,
    genbuf: [128]u8,
    slash: [*c]Chan,
    dot: [*c]Chan,
    note: [5]Note,
    nnote: c_short,
    notified: c_short,
    lastnote: Note,
    notify: ?fn (?*anyopaque, [*c]u8) callconv(.C) void,
    lockwait: [*c]Lock,
    lastlock: [*c]Lock,
    lastilock: [*c]Lock,
    wired: [*c]Mach,
    mp: [*c]Mach,
    nlocks: c_int,
    delaysched: ulong,
    priority: ulong,
    basepri: ulong,
    fixedpri: c_int,
    cpu: ulong,
    lastupdate: ulong,
    readytime: ulong,
    movetime: ulong,
    preempted: c_int,
    edf: ?*Edf,
    trace: c_int,
    qpc: uintptr,
    setargs: c_int,
    ureg: ?*anyopaque,
    dbgreg: ?*anyopaque,
    color: c_int,
    fc: ?*Fastcall,
    fcount: c_int,
    syscalltrace: [*c]u8,
};
pub const Proc = struct_Proc;
pub const struct_Lock = extern struct {
    key: u32int,
    isilock: c_int,
    unnamed_0: union_unnamed_4,
    pc: uintptr,
    p: [*c]Proc,
    m: [*c]Mach,
};
pub const struct_MCPU = extern struct {
    cpuinfo: [2][4]u32int,
    ncpuinfos: c_int,
    ncpuinfoe: c_int,
    isintelcpu: c_int,
};
pub const MCPU = struct_MCPU;
pub const struct_MFPU = extern struct {
    fcw: u16int,
    mxcsr: u32int,
    mxcsrmask: u32int,
};
pub const MFPU = struct_MFPU;
pub const PTE = u64int;
pub const struct_MMMU = extern struct {
    pml4: [*c]Page,
    pmap: [*c]PTE,
    pgszlg2: [4]uint,
    pgszmask: [4]uintmem,
    pgsz: [4]uint,
    npgsz: c_int,
    pml4kludge: Page,
};
pub const MMMU = struct_MMMU;
pub const struct_Pcidev = opaque {};
pub const Pcidev = struct_Pcidev;
pub const struct_PFPU = extern struct {
    fpustate: c_int,
    fxsave: [527]uchar,
    fpusave: ?*anyopaque,
};
pub const PFPU = struct_PFPU;
pub const struct_PMMU = extern struct {
    mmuptp: [4][*c]Page,
};
pub const PMMU = struct_PMMU;
pub const struct_PNOTIFY = extern struct {};
pub const PNOTIFY = struct_PNOTIFY;
const union_unnamed_6 = extern union {
    mach: Mach,
    machpage: [4096]uchar,
};
const struct_unnamed_8 = extern struct {
    pmstart: u64int,
    pmoccupied: u64int,
    pmend: u64int,
    pmpaged: u64int,
    vmstart: uintptr,
    vmunused: uintptr,
    vmunmapped: uintptr,
    vmend: uintptr,
    epoch: u64int,
    nmach: c_int,
    nonline: c_int,
    ticks: uint,
    copymode: uint,
};
const union_unnamed_7 = extern union {
    unnamed_0: struct_unnamed_8,
    syspage: [4096]uchar,
};
const union_unnamed_9 = extern union {
    machptr: [32][*c]Mach,
    ptrpage: [4096]uchar,
};
pub const struct_Sys = extern struct {
    machstk: [24576]uchar,
    pml4: [512]PTE,
    pdp: [512]PTE,
    pd: [512]PTE,
    pt: [512]PTE,
    vsvmpage: [4096]uchar,
    unnamed_0: union_unnamed_6,
    unnamed_1: union_unnamed_7,
    unnamed_2: union_unnamed_9,
    _57344_: [2][4096]uchar,
};
pub const Sys = struct_Sys;
pub const Tval = vlong;
pub const struct_Ureg = opaque {};
pub const Ureg = struct_Ureg;
pub const struct_Vctl = opaque {};
pub const Vctl = struct_Vctl;
pub extern var asmlist: [*c]Asm;
pub const struct_Alarms = extern struct {
    head: [*c]Proc,
};
pub const Alarms = struct_Alarms;
pub const struct_Cmdbuf = extern struct {
    buf: [*c]u8,
    f: [*c][*c]u8,
    nf: c_int,
};
pub const Cmdbuf = struct_Cmdbuf;
pub const struct_Cmdtab = extern struct {
    index: c_int,
    cmd: [*c]u8,
    narg: c_int,
};
pub const Cmdtab = struct_Cmdtab;
pub const struct_Confmem = opaque {};
pub const Confmem = struct_Confmem;
pub const struct_Dirtab = extern struct {
    name: [28]u8,
    qid: Qid,
    length: vlong,
    perm: c_long,
};
pub const Dirtab = struct_Dirtab;
pub const struct_Execvals = extern struct {
    entry: uvlong,
    textsize: ulong,
    datasize: ulong,
};
pub const Execvals = struct_Execvals;
pub const struct_Log = extern struct {
    opens: c_int,
    buf: [*c]u8,
    end: [*c]u8,
    rptr: [*c]u8,
    len: c_int,
    nlog: c_int,
    minread: c_int,
    logmask: c_int,
    readq: QLock,
    readr: Rendez,
};
pub const Log = struct_Log;
pub const struct_Logflag = extern struct {
    name: [*c]u8,
    mask: c_int,
};
pub const Logflag = struct_Logflag;
pub const struct_Mntwalk = extern struct {
    cddone: c_int,
    mh: [*c]Mhead,
    cm: [*c]Mount,
};
pub const Mntwalk = struct_Mntwalk;
pub const struct_Pallocpg = extern struct {
    head: [*c]Page,
    tail: [*c]Page,
    count: ulong,
    freecount: ulong,
};
pub const Pallocpg = struct_Pallocpg;
pub const struct_Palloc = extern struct {
    avail: [32]Pallocpg,
    user: ulong,
    hash: [512][*c]Page,
    hashlock: Lock,
    r: Rendez,
    pwait: QLock,
};
pub const Palloc = struct_Palloc;
pub const PhysUart = struct_PhysUart;
pub const struct_Uart = extern struct {
    regs: ?*anyopaque,
    saveregs: ?*anyopaque,
    name: [*c]u8,
    freq: ulong,
    bits: c_int,
    stop: c_int,
    parity: c_int,
    baud: c_int,
    phys: [*c]PhysUart,
    console: c_int,
    special: c_int,
    next: [*c]Uart,
    type: c_int,
    dev: c_int,
    opens: c_int,
    enabled: c_int,
    elist: [*c]Uart,
    perr: c_int,
    ferr: c_int,
    oerr: c_int,
    berr: c_int,
    serr: c_int,
    putc: ?fn (?*Queue, c_int) callconv(.C) c_int,
    iq: ?*Queue,
    oq: ?*Queue,
    rlock: Lock,
    istage: [2048]uchar,
    iw: [*c]uchar,
    ir: [*c]uchar,
    ie: [*c]uchar,
    tlock: Lock,
    ostage: [2048]uchar,
    op: [*c]uchar,
    oe: [*c]uchar,
    drain: c_int,
    modem: c_int,
    xonoff: c_int,
    blocked: c_int,
    cts: c_int,
    dsr: c_int,
    dcd: c_int,
    ctsbackoff: c_int,
    hup_dsr: c_int,
    hup_dcd: c_int,
    dohup: c_int,
    r: Rendez,
};
pub const Uart = struct_Uart;
pub const struct_PhysUart = extern struct {
    name: [*c]u8,
    pnp: ?fn () callconv(.C) [*c]Uart,
    enable: ?fn ([*c]Uart, c_int) callconv(.C) void,
    disable: ?fn ([*c]Uart) callconv(.C) void,
    kick: ?fn ([*c]Uart) callconv(.C) void,
    dobreak: ?fn ([*c]Uart, c_int) callconv(.C) void,
    baud: ?fn ([*c]Uart, c_int) callconv(.C) c_int,
    bits: ?fn ([*c]Uart, c_int) callconv(.C) c_int,
    stop: ?fn ([*c]Uart, c_int) callconv(.C) c_int,
    parity: ?fn ([*c]Uart, c_int) callconv(.C) c_int,
    modemctl: ?fn ([*c]Uart, c_int) callconv(.C) void,
    rts: ?fn ([*c]Uart, c_int) callconv(.C) void,
    dtr: ?fn ([*c]Uart, c_int) callconv(.C) void,
    status: ?fn ([*c]Uart, ?*anyopaque, c_long, c_long) callconv(.C) c_long,
    fifo: ?fn ([*c]Uart, c_int) callconv(.C) void,
    power: ?fn ([*c]Uart, c_int) callconv(.C) void,
    getc: ?fn ([*c]Uart) callconv(.C) c_int,
    putc: ?fn ([*c]Uart, c_int) callconv(.C) void,
    poll: ?fn ([*c]Uart) callconv(.C) void,
};
pub const struct_Procalloc = extern struct {
    ht: [128][*c]Proc,
    arena: [*c]Proc,
    free: [*c]Proc,
};
pub const Procalloc = struct_Procalloc;
pub const struct_Ref = extern struct {
    ref: c_int,
};
pub const Ref = struct_Ref;
pub const struct_Schedq = extern struct {
    head: [*c]Proc,
    tail: [*c]Proc,
    n: c_int,
};
pub const Schedq = struct_Schedq;
pub const Timer = struct_Timer;
pub const struct_Timers = opaque {};
pub const Timers = struct_Timers;
pub const struct_Timer = extern struct {
    tmode: c_int,
    tns: vlong,
    tf: ?fn (?*Ureg, [*c]Timer) callconv(.C) void,
    ta: ?*anyopaque,
    tt: ?*Timers,
    tticks: Tval,
    twhen: Tval,
    tnext: [*c]Timer,
};
pub const struct_Watchdog = extern struct {
    enable: ?fn () callconv(.C) void,
    disable: ?fn () callconv(.C) void,
    restart: ?fn () callconv(.C) void,
    stat: ?fn ([*c]u8, [*c]u8) callconv(.C) void,
};
pub const Watchdog = struct_Watchdog;
pub const struct_Watermark = extern struct {
    highwater: c_int,
    curr: c_int,
    max: c_int,
    hitmax: c_int,
    name: [*c]u8,
};
pub const Watermark = struct_Watermark;
pub const Devgen = fn ([*c]Chan, [*c]u8, [*c]Dirtab, c_int, c_int, [*c]Dir) callconv(.C) c_int;
pub const Aaccess: c_int = 0;
pub const Abind: c_int = 1;
pub const Atodir: c_int = 2;
pub const Aopen: c_int = 3;
pub const Amount: c_int = 4;
pub const Acreate: c_int = 5;
pub const Aremove: c_int = 6;
pub const COPEN: c_int = 1;
pub const CMSG: c_int = 2;
pub const CCEXEC: c_int = 8;
pub const CFREE: c_int = 16;
pub const CRCLOSE: c_int = 32;
pub const CCACHE: c_int = 128;
const enum_unnamed_10 = c_uint;
pub const BINTR: c_int = 1;
pub const Bipck: c_int = 4;
pub const Budpck: c_int = 8;
pub const Btcpck: c_int = 16;
pub const Bpktck: c_int = 32;
const enum_unnamed_11 = c_uint;
pub const NSMAX: c_int = 1000;
pub const NSLOG: c_int = 7;
pub const NSCACHE: c_int = 128;
const enum_unnamed_12 = c_uint;
pub const NUser: c_int = 0;
pub const NExit: c_int = 1;
pub const NDebug: c_int = 2;
const enum_unnamed_13 = c_uint;
pub const PG_NOFLUSH: c_int = 0;
pub const PG_TXTFLUSH: c_int = 1;
pub const PG_DATFLUSH: c_int = 2;
pub const PG_NEWCOL: c_int = 3;
pub const PG_MOD: c_int = 1;
pub const PG_REF: c_int = 2;
const enum_unnamed_14 = c_uint;
pub const SG_TYPE: c_int = 7;
pub const SG_TEXT: c_int = 0;
pub const SG_DATA: c_int = 1;
pub const SG_BSS: c_int = 2;
pub const SG_STACK: c_int = 3;
pub const SG_SHARED: c_int = 4;
pub const SG_PHYSICAL: c_int = 5;
pub const SG_CACHED: c_int = 16;
pub const SG_RONLY: c_int = 32;
pub const SG_CEXEC: c_int = 64;
const enum_unnamed_15 = c_uint;
pub const RENDLOG: c_int = 5;
pub const RENDHASH: c_int = 32;
pub const MNTLOG: c_int = 5;
pub const MNTHASH: c_int = 32;
pub const NFD: c_int = 100;
pub const PGHLOG: c_int = 9;
pub const PGHSIZE: c_int = 512;
const enum_unnamed_16 = c_uint;
pub const DELTAFD: c_int = 20;
const enum_unnamed_17 = c_uint;
pub const Trelative: c_int = 0;
pub const Tperiodic: c_int = 1;
const enum_unnamed_18 = c_uint;
pub const RFNAMEG: c_int = 1;
pub const RFENVG: c_int = 2;
pub const RFFDG: c_int = 4;
pub const RFNOTEG: c_int = 8;
pub const RFPROC: c_int = 16;
pub const RFMEM: c_int = 32;
pub const RFNOWAIT: c_int = 64;
pub const RFCNAMEG: c_int = 1024;
pub const RFCENVG: c_int = 2048;
pub const RFCFDG: c_int = 4096;
pub const RFREND: c_int = 8192;
pub const RFNOMNT: c_int = 16384;
const enum_unnamed_19 = c_uint;
pub const SSEG: c_int = 0;
pub const TSEG: c_int = 1;
pub const DSEG: c_int = 2;
pub const BSEG: c_int = 3;
pub const ESEG: c_int = 4;
pub const LSEG: c_int = 5;
pub const SEG1: c_int = 6;
pub const SEG2: c_int = 7;
pub const SEG3: c_int = 8;
pub const SEG4: c_int = 9;
pub const NSEG: c_int = 10;
const enum_unnamed_20 = c_uint;
pub const Dead: c_int = 0;
pub const Moribund: c_int = 1;
pub const Ready: c_int = 2;
pub const Scheding: c_int = 3;
pub const Running: c_int = 4;
pub const Queueing: c_int = 5;
pub const QueueingR: c_int = 6;
pub const QueueingW: c_int = 7;
pub const Wakeme: c_int = 8;
pub const Broken: c_int = 9;
pub const Stopped: c_int = 10;
pub const Rendezvous: c_int = 11;
pub const Waitrelease: c_int = 12;
pub const Proc_stopme: c_int = 1;
pub const Proc_exitme: c_int = 2;
pub const Proc_traceme: c_int = 3;
pub const Proc_exitbig: c_int = 4;
pub const Proc_tracesyscall: c_int = 5;
pub const TUser: c_int = 0;
pub const TSys: c_int = 1;
pub const TReal: c_int = 2;
pub const TCUser: c_int = 3;
pub const TCSys: c_int = 4;
pub const TCReal: c_int = 5;
pub const NERR: c_int = 64;
pub const NNOTE: c_int = 5;
pub const Npriq: c_int = 20;
pub const Nrq: c_int = 22;
pub const PriRelease: c_int = 20;
pub const PriEdf: c_int = 21;
pub const PriNormal: c_int = 10;
pub const PriExtra: c_int = 19;
pub const PriKproc: c_int = 13;
pub const PriRoot: c_int = 13;
const enum_unnamed_21 = c_uint;
pub const union_Ar0 = extern union {
    i: uintptr,
    l: uintptr,
    p: uintptr,
    u: @"usize",
    v: ?*anyopaque,
    vl: vlong,
};
pub const Ar0 = union_Ar0;
pub const PROCMAX: c_int = 2000;
const enum_unnamed_22 = c_uint;
pub const PRINTSIZE: c_int = 256;
pub const NUMSIZE: c_int = 12;
pub const READSTR: c_int = 4000;
const enum_unnamed_23 = c_uint;
pub extern var conffile: [*c]u8;
pub extern var configfile: [*c]u8;
pub extern var cpuserver: c_int;
pub extern var eve: [*c]u8;
pub extern var hostdomain: [*c]u8;
pub extern var initcode: [*c]uchar;
pub extern var kbdbuttons: c_int;
pub extern var noteidalloc: Ref;
pub extern var nphysseg: c_int;
pub extern var nsyscall: c_int;
pub extern var palloc: Palloc;
pub export var parseboothdr: ?fn ([*c]Chan, ulong, [*c]Execvals) callconv(.C) c_int = @import("std").mem.zeroes(?fn ([*c]Chan, ulong, [*c]Execvals) callconv(.C) c_int);
pub extern var physseg: [*c]Physseg;
pub extern var procalloc: Procalloc;
pub extern var qiomaxatomic: uint;
pub extern var statename: [*c][*c]u8;
pub extern var sysname: [*c]u8;
const struct_unnamed_24 = extern struct {
    n: [*c]u8,
    f: ?fn ([*c]Ar0, va_list) callconv(.C) void,
    r: Ar0,
};
pub extern var systab: [*c]struct_unnamed_24;
pub const LRESPROF: c_int = 3;
const enum_unnamed_25 = c_uint;
pub const NCMDFIELD: c_int = 128;
const enum_unnamed_26 = c_uint;
pub const Stagesize: c_int = 2048;
const enum_unnamed_27 = c_uint;
pub extern var consuart: [*c]Uart;
pub export var lprint: ?fn ([*c]u8, c_int) callconv(.C) void = @import("std").mem.zeroes(?fn ([*c]u8, c_int) callconv(.C) void);
pub const Qstarve: c_int = 1;
pub const Qmsg: c_int = 2;
pub const Qclosed: c_int = 4;
pub const Qflow: c_int = 8;
pub const Qcoalesce: c_int = 16;
pub const Qkick: c_int = 32;
const enum_unnamed_28 = c_uint;
pub const NPGSZ: c_int = 4;
const enum_unnamed_29 = c_uint;
pub extern var sys: [*c]Sys;
pub const KMap = anyopaque;
pub extern fn kmap([*c]Page) ?*KMap;
const struct_unnamed_30 = extern struct {
    machs: uint,
    exiting: c_int,
    ispanic: c_int,
    thunderbirdsarego: c_int,
};
pub export var active: struct_unnamed_30 = @import("std").mem.zeroes(struct_unnamed_30);
pub extern var kseg0: uintptr;
pub extern var dbgflg: [256]u8;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):67:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):73:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):164:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):186:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):194:9
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):316:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):317:9
pub const va_start = @compileError("unable to translate C expr: unexpected token .Equal"); // ./u.h:59:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `USED`"); // ./u.h:63:9
pub const va_arg = @compileError("unable to translate C expr: expected ')' instead got: PlusEqual"); // ./u.h:65:9
pub const nelem = @compileError("unable to translate C expr: unexpected token .LParen"); // ./port/lib.h:4:9
pub const offsetof = @compileError("unable to translate C expr: unexpected token .RParen"); // ./port/lib.h:5:9
pub const assert = @compileError("unable to translate macro: undefined identifier `_assert`"); // ./port/lib.h:6:9
pub const AOUT_MAGIC = @compileError("unable to translate macro: undefined identifier `S_MAGIC`"); // ./dat.h:32:9
pub const kunmap = @compileError("unable to translate C expr: unexpected token .Eof"); // ./dat.h:282:9
pub const VA = @compileError("unable to translate macro: undefined identifier `PTR2UINT`"); // ./dat.h:283:9
pub const DBG = @compileError("unable to translate C expr: expected ')'"); // ./dat.h:331:9
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 13);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 1);
pub const __clang_version__ = "13.0.1 ";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 13.0.1";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_TYPE__ = c_int;
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_TYPE__ = c_uint;
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __PIE__ = @as(c_int, 2);
pub const __pie__ = @as(c_int, 2);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __corei7 = @as(c_int, 1);
pub const __corei7__ = @as(c_int, 1);
pub const __tune_corei7__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __RTM__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __ELF__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const nil = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const JMPBUFSP = @as(c_int, 0);
pub const JMPBUFPC = @as(c_int, 1);
pub const JMPBUFDPC = @as(c_int, 0);
pub const FPFTZ = @as(c_int, 1) << @as(c_int, 15);
pub const FPINEX = @as(c_int, 1) << @as(c_int, 12);
pub const FPUNFL = @as(c_int, 1) << @as(c_int, 11);
pub const FPOVFL = @as(c_int, 1) << @as(c_int, 10);
pub const FPZDIV = @as(c_int, 1) << @as(c_int, 9);
pub const FPDNRM = @as(c_int, 1) << @as(c_int, 8);
pub const FPINVAL = @as(c_int, 1) << @as(c_int, 7);
pub const FPDAZ = @as(c_int, 1) << @as(c_int, 6);
pub const FPRNR = @as(c_int, 0) << @as(c_int, 13);
pub const FPRZ = @as(c_int, 3) << @as(c_int, 13);
pub const FPRPINF = @as(c_int, 2) << @as(c_int, 13);
pub const FPRNINF = @as(c_int, 1) << @as(c_int, 13);
pub const FPRMASK = @as(c_int, 3) << @as(c_int, 13);
pub const FPPEXT = @as(c_int, 0);
pub const FPPSGL = @as(c_int, 0);
pub const FPPDBL = @as(c_int, 0);
pub const FPPMASK = @as(c_int, 0);
pub const FPAINEX = @as(c_int, 1) << @as(c_int, 5);
pub const FPAUNFL = @as(c_int, 1) << @as(c_int, 4);
pub const FPAOVFL = @as(c_int, 1) << @as(c_int, 3);
pub const FPAZDIV = @as(c_int, 1) << @as(c_int, 2);
pub const FPADNRM = @as(c_int, 1) << @as(c_int, 1);
pub const FPAINVAL = @as(c_int, 1) << @as(c_int, 0);
pub const MORDER = @as(c_int, 0x0003);
pub const MREPL = @as(c_int, 0x0000);
pub const MBEFORE = @as(c_int, 0x0001);
pub const MAFTER = @as(c_int, 0x0002);
pub const MCREATE = @as(c_int, 0x0004);
pub const MCACHE = @as(c_int, 0x0010);
pub const MMASK = @as(c_int, 0x0017);
pub const OREAD = @as(c_int, 0);
pub const OWRITE = @as(c_int, 1);
pub const ORDWR = @as(c_int, 2);
pub const OEXEC = @as(c_int, 3);
pub const OTRUNC = @as(c_int, 16);
pub const OCEXEC = @as(c_int, 32);
pub const ORCLOSE = @as(c_int, 64);
pub const OEXCL = @as(c_int, 0x1000);
pub const NCONT = @as(c_int, 0);
pub const NDFLT = @as(c_int, 1);
pub const NSAVE = @as(c_int, 2);
pub const NRSTR = @as(c_int, 3);
pub const ERRMAX = @as(c_int, 128);
pub const KNAMELEN = @as(c_int, 28);
pub const QTDIR = @as(c_int, 0x80);
pub const QTAPPEND = @as(c_int, 0x40);
pub const QTEXCL = @as(c_int, 0x20);
pub const QTMOUNT = @as(c_int, 0x10);
pub const QTAUTH = @as(c_int, 0x08);
pub const QTFILE = @as(c_int, 0x00);
pub const DMDIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal);
pub const DMAPPEND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hexadecimal);
pub const DMEXCL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hexadecimal);
pub const DMMOUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hexadecimal);
pub const DMREAD = @as(c_int, 0x4);
pub const DMWRITE = @as(c_int, 0x2);
pub const DMEXEC = @as(c_int, 0x1);
pub const KiB = @as(c_int, 1024);
pub const MiB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1048576, .decimal);
pub const GiB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1073741824, .decimal);
pub const TiB = @as(c_longlong, 1099511627776);
pub const PiB = @as(c_longlong, 1125899906842624);
pub const EiB = @as(c_longlong, 1152921504606846976);
pub inline fn HOWMANY(x: anytype, y: anytype) @TypeOf((x + (y - @as(c_int, 1))) / y) {
    return (x + (y - @as(c_int, 1))) / y;
}
pub inline fn ROUNDUP(x: anytype, y: anytype) @TypeOf(HOWMANY(x, y) * y) {
    return HOWMANY(x, y) * y;
}
pub inline fn ROUNDDN(x: anytype, y: anytype) @TypeOf((x / y) * y) {
    return (x / y) * y;
}
pub inline fn MIN(a: anytype, b: anytype) @TypeOf(if (a < b) a else b) {
    return if (a < b) a else b;
}
pub inline fn MAX(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    return if (a > b) a else b;
}
pub const BI2BY = @as(c_int, 8);
pub const BY2V = @as(c_int, 8);
pub const BY2SE = @as(c_int, 8);
pub const BLOCKALIGN = @as(c_int, 8);
pub const PGSZ = @as(c_int, 4) * KiB;
pub const PGSHFT = @as(c_int, 12);
pub const PTSZ = @as(c_int, 4) * KiB;
pub const PTSHFT = @as(c_int, 9);
pub const MACHSZ = @as(c_int, 4) * KiB;
pub const MACHMAX = @as(c_int, 32);
pub const MACHSTKSZ = @as(c_int, 6) * (@as(c_int, 4) * KiB);
pub const KSTACK = @as(c_int, 16) * @as(c_int, 1024);
pub inline fn STACKALIGN(sp: anytype) @TypeOf(sp & ~(BY2SE - @as(c_int, 1))) {
    return sp & ~(BY2SE - @as(c_int, 1));
}
pub const HZ = @as(c_int, 100);
pub const MS2HZ = @as(c_int, 1000) / HZ;
pub inline fn TK2SEC(t: anytype) @TypeOf(t / HZ) {
    return t / HZ;
}
pub const UTZERO = @as(c_int, 0) + (@as(c_int, 2) * MiB);
pub inline fn UTROUND(t: anytype) @TypeOf(ROUNDUP(t, @as(c_int, 2) * MiB)) {
    return ROUNDUP(t, @as(c_int, 2) * MiB);
}
pub const USTKTOP = @as(c_ulonglong, 0x00007ffffffff000);
pub const USTKSIZE = (@as(c_int, 16) * @as(c_int, 1024)) * @as(c_int, 1024);
pub const TSTKTOP = USTKTOP - USTKSIZE;
pub const KSEG0 = @as(c_ulonglong, 0xfffffffff0000000);
pub const KSEG1 = @as(c_ulonglong, 0xffffff0000000000);
pub const KSEG2 = @as(c_ulonglong, 0xfffffe0000000000);
pub const PMAPADDR = @as(c_ulonglong, 0xffffffffffe00000);
pub const KZERO = @as(c_ulonglong, 0xfffffffff0000000);
pub const KTZERO = (KZERO + (@as(c_int, 1) * MiB)) + (@as(c_int, 64) * KiB);
pub const PTEPERTAB = @as(c_int, 256);
pub const PTEMAPMEM = PTEPERTAB * PGSZ;
pub const SEGMAPSIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const SSEGMAPSIZE = @as(c_int, 16);
pub const PTEVALID = @as(c_int, 1) << @as(c_int, 0);
pub const PTEWRITE = @as(c_int, 1) << @as(c_int, 1);
pub const PTERONLY = @as(c_int, 0) << @as(c_int, 1);
pub const PTEUSER = @as(c_int, 1) << @as(c_int, 2);
pub const PTEUNCACHED = @as(c_int, 1) << @as(c_int, 4);
pub inline fn getpgcolor(a: anytype) @TypeOf(@as(c_int, 0)) {
    _ = a;
    return @as(c_int, 0);
}
pub inline fn PTLX(v: anytype, l: anytype) @TypeOf((v >> ((l * PTSHFT) + PGSHFT)) & ((@as(c_int, 1) << PTSHFT) - @as(c_int, 1))) {
    return (v >> ((l * PTSHFT) + PGSHFT)) & ((@as(c_int, 1) << PTSHFT) - @as(c_int, 1));
}
pub inline fn PGLSZ(l: anytype) @TypeOf(@as(c_int, 1) << ((l * PTSHFT) + PGSHFT)) {
    return @as(c_int, 1) << ((l * PTSHFT) + PGSHFT);
}
pub const TMFM = (@as(c_int, 256) - @as(c_int, 32)) * MiB;
pub inline fn PPN(x: anytype) @TypeOf(x & ~(PGSZ - @as(c_int, 1))) {
    return x & ~(PGSZ - @as(c_int, 1));
}
pub const KVATOP = (KSEG0 & KSEG1) & KSEG2;
pub inline fn iskaddr(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(uintptr, a) & KVATOP) == KVATOP) {
    return (@import("std").zig.c_translation.cast(uintptr, a) & KVATOP) == KVATOP;
}
pub const MAXSYSARG = @as(c_int, 5);
pub const NCOLOR = @as(c_int, 8);
pub inline fn BLEN(s: anytype) @TypeOf(s.*.wp - s.*.rp) {
    return s.*.wp - s.*.rp;
}
pub inline fn BALLOC(s: anytype) @TypeOf(s.*.lim - s.*.base) {
    return s.*.lim - s.*.base;
}
pub inline fn pagesize(p: anytype) @TypeOf(@as(c_int, 1) << p.*.lg2size) {
    return @as(c_int, 1) << p.*.lg2size;
}
pub inline fn pagedout(s: anytype) @TypeOf(s == nil) {
    return s == nil;
}
pub const SEGMAXSIZE = SEGMAPSIZE * PTEMAPMEM;
pub inline fn physsegpgsize(ps: anytype) @TypeOf(@as(c_int, 1) << ps.*.lg2pgsize) {
    return @as(c_int, 1) << ps.*.lg2pgsize;
}
pub const NOCOLOR = -@as(c_int, 1);
pub inline fn segpgsize(s: anytype) @TypeOf(@as(c_int, 1) << s.*.lg2pgsize) {
    return @as(c_int, 1) << s.*.lg2pgsize;
}
pub inline fn REND(p: anytype, s: anytype) @TypeOf(p.*.rendhash[s & ((@as(c_int, 1) << RENDLOG) - @as(c_int, 1))]) {
    return p.*.rendhash[s & ((@as(c_int, 1) << RENDLOG) - @as(c_int, 1))];
}
pub inline fn MOUNTH(p: anytype, qid: anytype) @TypeOf(p.*.mnthash[qid.path & ((@as(c_int, 1) << MNTLOG) - @as(c_int, 1))]) {
    return p.*.mnthash[qid.path & ((@as(c_int, 1) << MNTLOG) - @as(c_int, 1))];
}
pub const DEVDOTDOT = -@as(c_int, 1);
pub const NISAOPT = @as(c_int, 8);
pub const DBGFLG = @as(c_int, 0);
pub const dbgprint = print;
