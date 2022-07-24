#![feature(link_llvm_intrinsics)]
#![feature(custom_test_frameworks)]
#![feature(unchecked_math)]
#![feature(const_mut_refs)]
#![feature(asm_const)]
#![allow(bad_asm_style, unused_unsafe)]
#![allow(dead_code, unused_macros)]
#![allow(non_upper_case_globals)]
#![no_std]

extern crate bitflags;

#[macro_use]
pub mod macros;

pub mod arch;
pub use arch::*;

pub mod clock;
pub mod panic;
pub mod taslock;
pub mod tod;

pub fn optionsinit(_s: &str) {}
