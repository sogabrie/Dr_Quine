#include <stdio.h>

/*
This program will print its own source when run.
*/

void	foo(char* s)
{
	printf(s,s,9,10,34);
}

int main(void)
{
	char* s;
	s = "#include <stdio.h>%3$c%3$c/*%3$cThis program will print its own source when run.%3$c*/%3$c%3$cvoid%2$cfoo(char* s)%3$c{%3$c%2$cprintf(s,s,9,10,34);%3$c}%3$c%3$cint main(void)%3$c{%3$c%2$cchar* s;%3$c%2$cs = %4$c%1$s%4$c;%3$c%2$cfoo(s);%3$c%2$c/*%3$c%2$cThis program will print its own source when run 2.%3$c%2$c*/%3$c%2$creturn 0;%3$c}";
	foo(s);
	/*
	This program will print its own source when run 2.
	*/
	return 0;
}