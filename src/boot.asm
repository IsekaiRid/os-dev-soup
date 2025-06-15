; boot.asm - boot sector dengan pesan Hello OS
[org 0x7c00]
bits 16

start:
    ; clear screen
    mov ah, 0x0
    mov al, 0x3
    int 0x10

    ; tulis string ke VGA text mode
    mov si, message
    mov di, 0xb800
    mov ax, 0xB800
    mov es, ax
    mov bx, 0        ; kolom awal

.loop:
    lodsb
    cmp al, 0
    je .hang
    mov [es:bx], al
    inc bx
    mov byte [es:bx], 0x07 ; warna: abu putih
    inc bx
    jmp .loop

.hang:
    cli
    hlt
    jmp $

message db "Hello OS", 0

; isi sisa jadi 512 byte
times 510-($-$$) db 0
dw 0xAA55
