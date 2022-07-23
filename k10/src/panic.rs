use crate::println;
use core::panic::PanicInfo;
/// This function is called on panic.
#[panic_handler]
fn panic(panic_info: &PanicInfo) -> ! {
    if let Some(location) = panic_info.location() {
        println!(
            "panic occurred in file '{}' at line {}",
            location.file(),
            location.line(),
        );
    } else {
        println!("panic occurred but can't get location information...");
    }
    loop {}
}
