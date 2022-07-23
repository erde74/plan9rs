use std::{
    env,
    error::Error,
    fs::{self},
    path::PathBuf,
};

fn main() -> Result<(), Box<dyn Error>> {
    // build directory for this crate
    let out_dir = PathBuf::from(env::var_os("OUT_DIR").unwrap());

    // extend the library search path
    println!("cargo:rustc-link-search={}", out_dir.display());

    // put `link.x` in the build directory
    // File::create(out_dir.join("link.x"))?.write_all(include_bytes!("link.x"))?;

    // link to `librt.a`
    fs::copy("libboot.a", out_dir.join("libboot.a"))?; // <- NEW!
    println!("cargo:rustc-link-lib=static=boot"); // <- NEW!

    // rebuild if `librt.a` changed
    println!("cargo:rerun-if-changed=libboot.a"); // <- NEW!

    Ok(())
}
