BITS 64
;This program will print its own source when run.
section .rodata
	s: db "BITS 64%3$c;This program will print its own source when run.%3$csection .rodata%3$c%2$cs: db %4$c%1$s%4$c, 0%3$c%3$csection .text%3$c    global main%3$c    extern printf%3$c%3$cColleen:%3$c%2$cmov rsi, rdi%3$c%2$cmov rdx, 9%3$c%2$cmov rcx, 10%3$c%2$cmov r8, 34%3$c%2$cxor rax, rax%3$c%2$ccall printf%3$c%2$cret%3$c%3$cmain:%3$c%2$clea rdi, [rel s]%3$c%2$c;This program will print its own source when run 2.%3$c%2$ccall Colleen%3$c%2$cxor rax, rax%3$c%2$cret%3$c", 0

section .text
    global main
    extern printf

Colleen:
	mov rsi, rdi
	mov rdx, 9
	mov rcx, 10
	mov r8, 34
	xor rax, rax
	call printf
	ret

main:
	lea rdi, [rel s]
	;This program will print its own source when run 2.
	call Colleen
	mov rax, 60
	xor rdi, rdi
	syscall
