a:
	nasm -f elf64  Colleen.s -o Colleen.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Colleen.o -o a.out

b:
	nasm -f elf64  Grace.s -o Grace.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Grace.o -o a.out

c:
	nasm -f elf64 -g -F dwarf Grace.s -o Grace.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Grace.o -o a.out

d:
	nasm -f elf64  aa.s -o aa.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror aa.o -o a.out

s:
	nasm -f elf64  Sully.s -o Sully.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Sully.o -o a.out