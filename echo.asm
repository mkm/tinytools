[BITS 64]

section .text

global _start
_start:
    lea rbx, [rsp + 0x10]
    lea rdi, [rel buffer]
    xor eax, eax

    jmp loop_test
loop:
    mov rsi, [rbx]

    jmp inner_loop_test
inner_loop:
    movsb
inner_loop_test:
    test BYTE [rsi], 0xFF
    jnz inner_loop

    mov al, 0x20
    stosb
    add rbx, 0x8
loop_test:
    cmp QWORD [rbx], 0
    jnz loop

    mov al, 0x0A
    stosb
    lea rsi, [rel buffer]
    sub rdi, rsi
    mov rdx, rdi
    mov rax, 1
    mov rdi, 1
    syscall

    xor edi, edi
    mov rax, 60
    syscall

section .bss

buffer:
    resb 0x1000
