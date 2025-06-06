#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int	main(void)
{
	char* s = "#include <stdio.h>%3$c#include <string.h>%3$c#include <stdlib.h>%3$c#include <unistd.h>%3$c%3$cint%2$cmain(void)%3$c{%3$c%2$cchar* s = %4$c%1$s%4$c;%3$c%2$cint i = %5$d;%3$c%2$cchar filename[100];%3$c%2$cchar newfilename[100];%3$c%2$cchar exe[100];%3$c%2$cchar compilation[300];%3$c%2$cchar runexe[200];%3$c%3$c%2$cif(i <= 0)%3$c%2$c%2$creturn 0;%3$c%2$c%3$c%2$csprintf(filename,%4$cSully_%%d.c%4$c, i);%3$c%2$cif%2$c(!strcmp(filename, __FILE__))%3$c%2$c%2$c--i;%3$c%3$c%2$csprintf(exe, %4$cSully_%%d%4$c, i);%3$c%2$csprintf(newfilename,%4$cSully_%%d.c%4$c, i);%3$c%2$csprintf(compilation, %4$cgcc -o %%s %%s%4$c, exe, newfilename);%3$c%2$csprintf(runexe,%4$c./%%s%4$c,exe);%3$c%3$c%2$cFILE* fd = fopen(newfilename, %4$cw%4$c);%3$c%2$cif(fd <= 0)%3$c%2$c%2$creturn 1;%3$c%3$c%2$cfprintf(fd, s, s, 9, 10, 34, i);%3$c%2$cfclose(fd);%3$c%3$c%2$csystem(compilation);%3$c%2$csystem(runexe);%3$c%3$c%2$creturn 0;%3$c}";
	int i = 5;
	char filename[100];
	char newfilename[100];
	char exe[100];
	char compilation[300];
	char runexe[200];

	if(i <= 0)
		return 0;
	
	sprintf(filename,"Sully_%d.c", i);
	if	(!strcmp(filename, __FILE__))
		--i;

	sprintf(exe, "Sully_%d", i);
	sprintf(newfilename,"Sully_%d.c", i);
	sprintf(compilation, "gcc -o %s %s", exe, newfilename);
	sprintf(runexe,"./%s",exe);

	FILE* fd = fopen(newfilename, "w");
	if(fd <= 0)
		return 1;

	fprintf(fd, s, s, 9, 10, 34, i);
	fclose(fd);

	system(compilation);
	system(runexe);

	return 0;
}