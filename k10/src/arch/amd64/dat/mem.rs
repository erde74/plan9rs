pub const KIB: usize = 1024; /* Kibi 0x0000000000000400 */
pub const MiB: usize = 1048576; /* Mebi 0x0000000000100000 */
pub const GIB: usize = 1073741824; /* Gibi 000000000040000000 */
pub const TIB: usize = 1099511627776; /* Tebi 0x0000010000000000 */
pub const PIB: usize = 1125899906842624; /* Pebi 0x0004000000000000 */
pub const EIB: usize = 1152921504606846976; /* Exbi 0x1000000000000000 */

pub const PGSZ: usize = 4 * KIB; /* page size */
pub const PTSZ: usize = 4 * KIB; /* page table page size */

pub const MACHSZ: usize = 4 * KIB; /* Mach+stack size */
pub const MACHMAX: usize = 32; /* max. number of cpus */
pub const MACHSTKSZ: usize = 6 * 4 * KIB; /* Mach stack size */
