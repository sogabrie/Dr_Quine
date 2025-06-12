BITS 64

section .data
    i: dq 5
    newfile: db "BITS 64%3$c%3$csection .data%3$c    i: dq 5%3$c    newfile: db %4$c%4$c, 0%3$c    flag: db %4$cw%4$c, 0%3$c    filename: db %4$cSully_%%d.s%4$c, 0%3$c    exe: db %4$cSully_%%d%4$c, 0%3$c    compilation: db %4$cnasm -f elf64  %%s.s -o %%s.o && gcc -z execstack -no-pie %%s.o -o %%s%4$c, 0%3$c    runexe: %4$c./%%s%4$c, 0%3$c%3$csection .bss%3$c    exeN resb 100%3$c    fileN resb 100%3$c    runE resb 200%3$c    compil resb 300%3$c%3$csection .text%3$c    extern fprintf fopen fclose fprintf sprintf system%3$c    global main%3$c%3$cmain:%3$c    mov rax, [i]%3$c    cmp rax, 0%3$c    jle .end%3$c%3$c    cmp rax, 5%3$c    jz .continu%3$c    dec rax%3$c    mov i, rax%3$c%3$c.continu%3$c    mov rdi, fileN%3$c    mov rsi, filename%3$c    mov rdx, rax%3$c    call sprintf%3$c%3$c    mov rdi, exeN%3$c    mov rsi, exe%3$c    mov rdx, rax%3$c    call sprintf%3$c%3$c    mov rdi, runE%3$c    mov rsi, runexe%3$c    mov rdx, exeN%3$c    call sprintf%3$c%3$c    mov rdi, compil%3$c    mov rsi, compilation%3$c    mov rdx, exeN%3$c    call sprintf%3$c%3$c    mov rdi, fileN%3$c    mov rsi, flag%3$c    call fopen%3$c    test rax, rax%3$c    jz .end%3$c    mov r12, rax%3$c%3$c    mov r10, i%3$c    sub rsp, r10%3$c    push r10%3$c%3$c    mov rdi, r12%3$c    lea rsi, [rel newfile]%3$c    lea rdx, [rel newfile]%3$c    mov rcx, 9%3$c    mov r8, 10%3$c    mov r9, 34%3$c    xor rax, rax%3$c    call fprintf%3$c    add rsp, 16%3$c    mov rdi, r12%3$c    call fclose%3$c%3$c    mov rdi, compil%3$c    call system%3$c%3$c    mov rdi, runE%3$c    call system%3$c%3$c.end%3$c    mov rax, 60%3$c%2$cxor rdi, rdi%3$c%2$csyscall%3$c", 0
    flag: db "w", 0
    filename: db "Sully_%d.s", 0
    exe: db "Sully_%d", 0
    compilation: db "nasm -f elf64  %s.s -o %s.o && gcc -z execstack -no-pie %s.o -o %s", 0
    runexe: "./%s", 0

section .bss
    exeN resb 100
    fileN resb 100
    runE resb 200
    compil resb 300

section .text
    extern fprintf fopen fclose fprintf sprintf system
    global main

main:
    mov rax, [i]
    cmp rax, 0
    jle .end

    cmp rax, 5
    jz .continu
    dec rax
    mov i, rax

.continu
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

    mov r10, i
    sub rsp, r10
    push r10

    mov rdi, r12
    lea rsi, [rel newfile]
    lea rdx, [rel newfile]
    mov rcx, 9
    mov r8, 10
    mov r9, 34
    xor rax, rax
    call fprintf
    add rsp, 16
    mov rdi, r12
    call fclose

    mov rdi, compil
    call system

    mov rdi, runE
    call system

.end
    mov rax, 60
	xor rdi, rdi
	syscall