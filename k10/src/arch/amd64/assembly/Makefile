# CC=gcc -fpie
CFLAGS=-fPIC -fno-stack-protector -O0 -mno-red-zone -ffreestanding -fno-builtin

all: entry.o l64idt.o l64vsyscall.o
	objdump -S -drwC -Mintel entry.o > entry_intel.S
	# objdump -S -d -Mintel entry.o > entry_intel.S
	ar r libboot.a entry.o l64idt.o l64vsyscall.o

l64idt.o: l64idt.S
	$(CC) $(CFLAGS) -c l64idt.S

l64vsyscall.o: l64vsyscall.S
	$(CC) $(CFLAGS) -c l64vsyscall.S

entry.o: entry.S
	$(CC) $(CFLAGS) -c entry.S

clean:
	rm -f *.o *.a entry_intel.S