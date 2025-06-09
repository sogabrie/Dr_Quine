all:
	nasm -f elf64  Colleen.s -o Colleen.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Colleen.o -o a.out