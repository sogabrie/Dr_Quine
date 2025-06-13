BITS 64

section .data
    i: dq 5
    newfile: db "", 0
    flag: db "w", 0
    filename: db "Sully_%d.s", 0
    exe: db "Sully_%d", 0
    compilation: db "nasm -f elf64  %s.s -o %s.o && gcc -z execstack -no-pie %s.o -o %s", 0
    runexe: db "./%s", 0

section .bss
    exeN: resb 100
    fileN: resb 100
    runE: resb 200
    compil: resb 350

section .text
    extern fprintf, fopen, fclose, sprintf, system
    global main

main:
    sub rsp, 8
    mov rax, [i]
    cmp rax, 0
    jle .end

    cmp rax, 5
    mov r13, rax
    jz .continu
    dec r13

.continu:
    lea rdi, [rel fileN]
    lea rsi, [rel filename]
    mov rdx, r13
    call sprintf

    lea rdi, [rel exeN]
    lea rsi, [rel exe]
    mov rdx, r13
    call sprintf

    lea rdi, [rel runE]
    lea rsi, [rel runexe]
    lea rdx, [rel exeN]
    call sprintf

    lea rdi, [rel compil]
    lea rsi, [rel compilation]
    lea rdx, [rel exeN]
    lea rcx, [rel exeN]
    lea r8, [rel exeN]
    lea r9, [rel exeN]
    call sprintf

    mov rdi, fileN
    mov rsi, flag
    call fopen
    test rax, rax
    jz .end
    mov r12, rax

    mov r10, r13

    mov rdi, r12
    lea rsi, [rel newfile]
    lea rdx, [rel newfile]
    mov rcx, 9
    mov r8, 10
    mov r9, 34
    sub rsp, 16
    mov qword [rsp], r10
    xor rax, rax
    call fprintf
    add rsp, 16
    mov rdi, r12
    call fclose

    mov rdi, compil
    call system

    mov rdi, runE
    call system

.end:
    add rsp, 8
    mov rax, 60
	xor rdi, rdi
	syscall