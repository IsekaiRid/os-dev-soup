ISO_NAME = myos.iso
KERNEL_BIN = kernel.bin

all: iso

kernel:
	nasm -f elf64 src/boot.asm -o boot.o
	gcc -ffreestanding -c src/kernel.c -o kernel.o
	ld -Ttext 0x1000 -o $(KERNEL_BIN) boot.o kernel.o --oformat binary

iso: kernel
	mkdir -p iso/boot/grub
	cp $(KERNEL_BIN) iso/boot/kernel.bin
	cp boot/grub/grub.cfg iso/boot/grub/
	grub-mkrescue -o $(ISO_NAME) iso

clean:
	rm -rf *.o *.iso $(KERNEL_BIN) iso
