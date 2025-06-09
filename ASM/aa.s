%define FILE "Grace_kid.s"
%define STRN ""
; %define MAIN 

;This program will print its own source when run.
section .rodata
    file: db FILE, 0
    newfile: db STRN, 0
    flag: db "w", 0

    ; msg db "H1!", 10  
    ; len equ $ - msg            
section .text
global main
extern fopen, fclose, fprintf, exit
main:
; lea rdi, [rel file]
mov rdi, file
; lea rsi, [rel flag]
mov rsi, flag
; mov rsi, 577
; mov rdx, 0644
call fopen
test rax, rax
; je .done
mov r12, rax  

    ; push rax
    ; push rbx
    ; push rcx
    ; push rdx
    ; mov rax, 4    
    ; mov rbx, 1      
    ; mov rcx, msg      
    ; mov rdx, len
    ; int 0x80 
    ; pop rax
    ; pop rbx
    ; pop rcx
    ; pop rdx
mov rdi, r12
lea rsi, [rel newfile]
; mov rsi, newfile
lea rdx, [rel newfile]
; mov rdx, newfile
mov rcx, 9
mov r8, 10
mov r9, 34
xor rax, rax
call fprintf
mov rdi, r12
call fclose
xor rdi, rdi
call exit
; .done:
;     xor rdi, rdi
;     call exit