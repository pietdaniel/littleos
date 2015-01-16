global loader

MAGIC_NUMBER equ 0x1BADB33F
CHECKSUM     equ -MAGIC_NUMBER 

section .text:
align 4
  dd MAGIC_NUMBER
  dd CHECKSUM

loader:
  mov eax, 0xDEADB337
.loop:
  jmp .loop
