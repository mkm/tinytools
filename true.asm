[BITS 64]

section .text

global _start
_start:
    mov rax, 60
    xor edi, edi
    syscall
