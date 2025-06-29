BITS 64

%define FF "Grace_kid.s"
%define STRN "BITS 64%3$c%3$c%%define FF %4$cGrace_kid.s%4$c%3$c%%define STRN %4$c%1$s%4$c%3$c;This program will print its own source when run.%3$c%3$csection .rodata%3$c    file: db FF, 0%3$c    newfile: db STRN, 0%3$c    flag: db %4$cw%4$c, 0%3$c%3$csection .text%3$c    global main%3$c    extern fopen, fclose, fprintf, exit%3$c%3$c%%macro MAIN 0%3$cmain:%3$c    sub rsp, 8%3$c    mov rdi, file%3$c    mov rsi, flag%3$c    call fopen%3$c    test rax, rax%3$c    mov r12, rax%3$c    mov rdi, r12%3$c    lea rsi, [rel newfile]%3$c    lea rdx, [rel newfile]%3$c    mov rcx, 9%3$c    mov r8, 10%3$c    mov r9, 34%3$c    xor rax, rax%3$c    call fprintf%3$c    mov rdi, r12%3$c    call fclose%3$c    add rsp, 8%3$c    xor rdi, rdi%3$c    call exit%3$c%%endmacro%3$cMAIN"
;This program will print its own source when run.

section .rodata
    file: db FF, 0
    newfile: db STRN, 0
    flag: db "w", 0

section .text
    global main
    extern fopen, fclose, fprintf, exit

%macro MAIN 0
main:
    sub rsp, 8
    mov rdi, file
    mov rsi, flag
    call fopen
    test rax, rax
    mov r12, rax
    mov rdi, r12
    lea rsi, [rel newfile]
    lea rdx, [rel newfile]
    mov rcx, 9
    mov r8, 10
    mov r9, 34
    xor rax, rax
    call fprintf
    mov rdi, r12
    call fclose
    add rsp, 8
    xor rdi, rdi
    call exit
%endmacro
MAIN