BITS 64

section .data
    i: dq 3
    newfile: db "BITS 64%3$c%3$csection .data%3$c    i: dq %5$d%3$c    newfile: db %4$c%1$s%4$c, 0%3$c    flag: db %4$cw%4$c, 0%3$c    filename: db %4$cSully_%%d.s%4$c, 0%3$c    exe: db %4$cSully_%%d%4$c, 0%3$c    compilation: db %4$cnasm -f elf64 %%s.s -o %%s.o && gcc -z execstack -no-pie %%s.o -o %%s && rm -rf Sully_*.o%4$c, 0%3$c    runexe: db %4$c./%%s%4$c, 0%3$c    su: db %4$cSully%4$c, 0%3$c%3$csection .bss%3$c    exeN: resb 100%3$c    fileN: resb 100%3$c    runE: resb 200%3$c    compil: resb 350%3$c%3$csection .text%3$c    extern fprintf, fopen, fclose, sprintf, system, strcmp, strlen, exit%3$c    global main%3$c%3$cmain:%3$c    sub rsp, 8%3$c    mov rax, [i]%3$c    cmp rax, 0%3$c    jle .end%3$c%3$c    mov r13, rax%3$c%%ifndef FIRST%3$c    dec r13%3$c%%endif %3$c%3$c.continu:%3$c    lea rdi, [rel fileN]%3$c    lea rsi, [rel filename]%3$c    mov rdx, r13%3$c    call sprintf%3$c%3$c    lea rdi, [rel exeN]%3$c    lea rsi, [rel exe]%3$c    mov rdx, r13%3$c    call sprintf%3$c%3$c    lea rdi, [rel runE]%3$c    lea rsi, [rel runexe]%3$c    lea rdx, [rel exeN]%3$c    call sprintf%3$c%3$c    lea rdi, [rel compil]%3$c    lea rsi, [rel compilation]%3$c    lea rdx, [rel exeN]%3$c    lea rcx, [rel exeN]%3$c    lea r8, [rel exeN]%3$c    lea r9, [rel exeN]%3$c    call sprintf%3$c%3$c    mov rdi, fileN%3$c    mov rsi, flag%3$c    call fopen%3$c    test rax, rax%3$c    jz .end%3$c    mov r12, rax%3$c%3$c    mov r10, r13%3$c%3$c    mov rdi, r12%3$c    lea rsi, [rel newfile]%3$c    lea rdx, [rel newfile]%3$c    mov rcx, 9%3$c    mov r8, 10%3$c    mov r9, 34%3$c    sub rsp, 16%3$c    mov qword [rsp], r10%3$c    xor rax, rax%3$c    call fprintf%3$c    add rsp, 16%3$c    mov rdi, r12%3$c    call fclose%3$c%3$c    mov rdi, compil%3$c    call system%3$c%3$c    mov rdi, runE%3$c    call system%3$c%3$c.end:%3$c    add rsp, 8%3$c    call exit", 0
    flag: db "w", 0
    filename: db "Sully_%d.s", 0
    exe: db "Sully_%d", 0
    compilation: db "nasm -f elf64 %s.s -o %s.o && gcc -z execstack -no-pie %s.o -o %s && rm -rf Sully_*.o", 0
    runexe: db "./%s", 0
    su: db "Sully", 0

section .bss
    exeN: resb 100
    fileN: resb 100
    runE: resb 200
    compil: resb 350

section .text
    extern fprintf, fopen, fclose, sprintf, system, strcmp, strlen, exit
    global main

main:
    sub rsp, 8
    mov rax, [i]
    cmp rax, 0
    jle .end

    mov r13, rax
%ifndef FIRST
    dec r13
%endif 

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
    call exit