[BITS 64]

%define BUFLEN 0x1000

section .text

global _start
_start:

loop:
    xor eax, eax
    xor edi, edi
    lea rsi, [rel buffer]
    mov rdx, BUFLEN
    syscall

    cmp rax, 0
    jle done
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel buffer]
    syscall
    jmp loop

done:
    mov rax, 60
    xor edi, edi
    syscall

section .bss

buffer:
    resb BUFLEN
