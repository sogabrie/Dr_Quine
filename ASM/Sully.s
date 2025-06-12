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
    exeN resb 100
    fileN resb 100
    runE resb 200
    compil resb 300

section .text
    extern fprintf, fopen, fclose, sprintf, system
    global main

main:
    mov rax, [i]
    cmp rax, 0
    jle .end

    cmp rax, 5
    jz .continu
    dec rax
    mov r13, rax

.continu:
    mov rdi, fileN
    mov rsi, filename
    mov rdx, rax
    call sprintf

    mov rdi, exeN
    mov rsi, exe
    mov rdx, rax
    call sprintf

    mov rdi, runE
    mov rsi, runexe
    mov rdx, exeN
    call sprintf

    mov rdi, compil
    mov rsi, compilation
    mov rdx, exeN
    call sprintf

    mov rdi, fileN
    mov rsi, flag
    call fopen
    test rax, rax
    jz .end
    mov r12, rax

    mov r10, r13
    sub rsp, 8
    mov [rsp], r10

    mov rdi, r12
    lea rsi, [rel newfile]
    lea rdx, [rel newfile]
    mov rcx, 9
    mov r8, 10
    mov r9, 34
    xor rax, rax
    call fprintf
    add rsp, 8
    mov rdi, r12
    call fclose

    mov rdi, compil
    call system

    mov rdi, runE
    call system

.end:
    mov rax, 60
	xor rdi, rdi
	syscall