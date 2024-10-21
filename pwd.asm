[BITS 64]

%define BUFLEN 0x1000

section .text

global _start
_start:
    mov rax, 79
    lea rdi, [rel buffer]
    mov rsi, BUFLEN
    syscall

    lea rsi, [rel buffer]
    mov BYTE [rsi + rax], 0x0A
    lea rdx, [rax + 1]
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 60
    xor edi, edi
    syscall

section .bss
buffer:
    resb BUFLEN
