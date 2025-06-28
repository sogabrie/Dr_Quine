BITS 64

%define FF "Grace_kid.s"
%define STRN ""
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