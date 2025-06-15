boot.img: src/boot.asm
	nasm -f bin src/boot.asm -o boot.img

clean:
	rm -f boot.img
