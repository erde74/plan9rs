# CC=gcc -fpie
CFLAGS=-fPIC -fno-stack-protector -O0 -mno-red-zone -ffreestanding -fno-builtin

all: l64idt.o l64vsyscall.o
	ar r libboot.a l64idt.o l64vsyscall.o

l64idt.o: l64idt.S
	$(CC) $(CFLAGS) -c l64idt.S

l64vsyscall.o: l64vsyscall.S
	$(CC) $(CFLAGS) -c l64vsyscall.S

clean:
	rm -f *.o *.a entry_intel.S