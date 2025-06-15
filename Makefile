CC=i686-elf-gcc
LD=i686-elf-ld
CFLAGS=-ffreestanding -O2 -Wall -Wextra
LDFLAGS=-Tlink.ld

all: iso

kernel.o: src/kernel.c
	$(CC) $(CFLAGS) -c $< -o $@

boot.o: src/boot.asm
	nasm -f elf32 $< -o $@

kernel.bin: boot.o kernel.o
	$(LD) $(LDFLAGS) -o $@ $^

iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/kernel.bin
	cp boot/grub/grub.cfg iso/boot/grub
	grub-mkrescue -o myos.iso iso

clean:
	rm -f *.o *.bin *.iso
	rm -rf iso
