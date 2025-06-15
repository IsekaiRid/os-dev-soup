; src/boot.asm
[bits 64]
section .text
global _start
extern kernel_main        ; Fungsi C yang akan kita panggil

_start:
    call kernel_main      ; Panggil fungsi dari C
    hlt
    jmp $
