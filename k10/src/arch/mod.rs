#[cfg(target_arch = "x86_64")]
pub mod amd64;

#[cfg(target_arch = "x86_64")]
pub use amd64::*;

pub fn coherence() {
    unsafe { x86::fence::mfence() }
}
