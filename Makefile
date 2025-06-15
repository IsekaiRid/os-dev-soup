boot.img: boot.asm
	nasm -f bin src/boot.asm -o boot.img

clean:
	rm -f boot.img
