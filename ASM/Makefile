a:
	nasm -f elf64  Colleen.s -o Colleen.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Colleen.o -o a.out

b:
	nasm -f elf64  Grace.s -o Grace.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Grace.o -o a.out

c:
	nasm -f elf64 -g -F dwarf Grace.s -o Grace.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Grace.o -o a.out

s:
	nasm -DFIRST -f elf64  Sully.s -o Sully.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Sully.o -o Sully

ss:
	nasm -f elf64 -g -F dwarf Sully.s -o Sully.o
	gcc -z execstack -no-pie -Wall -Wextra -Werror Sully.o -o Sully

clean:
	rm -rf *.o *_*.s 

#x/s &fileN , p/d $r13,  p/x $r13 , x/s $rdx , gdb ./a.out 