#include <stdio.h>
#define FIL "Grace_kid.c"
#define S "#include <stdio.h>%3$c#define FIL %4$cGrace_kid.c%4$c%3$c#define S %4$c%1$s%4$c%3$c#define MAIN int main(void) { char* s = S; FILE* fl = fopen(FIL,%4$cw%4$c); if (fl != NULL) fprintf(fl,s,s,9,10,34); return 0;}%3$c%3$c/*%3$cThis program will print its own source when run.%3$c*/%3$c%3$cMAIN"
#define MAIN int main(void) { char* s = S; FILE* fl = fopen(FIL,"w"); if (fl != NULL) fprintf(fl,s,s,9,10,34); return 0;}

/*
This program will print its own source when run.
*/

MAIN