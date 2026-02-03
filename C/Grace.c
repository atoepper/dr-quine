#include <stdio.h>
#define KID "Grace_kid.c"
#define CODE "#include <stdio.h>%1$c#define KID %3$cGrace_kid.c%3$c%1$c#define CODE %3$c%4$s%3$c%1$c#define PROGRAM int main (void) { FILE *f = fopen(KID, %3$cw%3$c); if (!f) return(1); fprintf(f, CODE, 10, 9, 34, CODE); fclose(f); return (0);}%1$c/*%1$c%2$cThis is the required comment%1$c*/%1$cPROGRAM%1$c"
#define PROGRAM int main (void) { FILE *f = fopen(KID, "w"); if (!f) return(1); fprintf(f, CODE, 10, 9, 34, CODE); fclose(f); return (0);}
/*
	This is the required comment
*/
PROGRAM
