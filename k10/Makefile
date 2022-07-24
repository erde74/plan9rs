all:
	cd src/arch/x86_64/assembly && make
	cp src/arch/x86_64/assembly/libboot.a .

clean:
	rm -fr image.iso libboot.a
	cd src/arch/x86_64/assembly && make clean

iso: image.iso

image.iso: target/x86_64-unknown-none/debug/k10
	cp target/x86_64-unknown-none/debug/k10 iso
	xorriso -as mkisofs -b limine-cd.bin \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        --efi-boot limine-eltorito-efi.bin \
        -efi-boot-part --efi-boot-image --protective-msdos-label \
        iso -o image.iso
	../limine/limine-install-linux-x86_64 image.iso

qemu: iso
	qemu-system-x86_64 -cpu max -smp 4 -m 2048 -serial stdio -cdrom image.iso
