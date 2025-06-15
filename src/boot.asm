[BITS 16]              ; Kita pakai real mode 16-bit
[ORG 0x7C00]           ; BIOS akan load bootloader di alamat 0x7C00

section .text
start:
    cli                ; Clear interrupt
    hlt                ; Halt CPU (berhenti)

    jmp $              ; Loop di tempat agar tidak mengeksekusi sampah

times 510 - ($ - $$) db 0 ; Isi padding hingga 510 byte
dw 0xAA55               ; Signature boot sector di byte ke-511-512
