// src/kernel.c
void _start() {
    const char* str = "Hello from kernel!";
    char* video = (char*)0xb8000;

    for (int i = 0; str[i] != '\0'; i++) {
        video[i * 2] = str[i];        // Karakter
        video[i * 2 + 1] = 0x07;      // Warna abu di latar hitam
    }

    while (1); // Gantung sistem
}
