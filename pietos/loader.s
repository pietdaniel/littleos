global loader

ALI     equ 1 << 0
MEMINFO equ 1 << 1
FLAGS   equ ALI | MEMINFO
MAGIC_NUMBER equ 0x1BADB002
CHECKSUM     equ -(MAGIC_NUMBER + FLAGS)

section .text:
align 4
  dd MAGIC_NUMBER
  dd FLAGS
  dd CHECKSUM

loader:
  mov eax, 0xDEADB33F

loop:
  jmp loop
