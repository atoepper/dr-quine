#include <stdio.h>
#include <stdlib.h>
#define CODE "#include <stdio.h>%1$c#include <stdlib.h>%1$c#define CODE %3$c%5$s%3$c%1$cint main (void)%1$c{%1$c%2$cint i = %4$d;%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn (0);%1$c%2$cchar name[16];%1$c%2$cchar comp_and_exec[64];%1$c%2$csnprintf(name, 16, %3$cSully_%%d.c%3$c, i - 1);%1$c%2$csnprintf(comp_and_exec, 64, %3$cgcc %%s -o Sully_%%d && ./Sully_%%d%3$c, name, i - 1, i - 1);%1$c%2$cFILE *f = fopen(name, %3$cw%3$c);%1$c%2$cif (!f)%1$c%2$c%2$creturn (1);%1$c%2$cfprintf(f, CODE, 10, 9, 34, i - 1, CODE);%1$c%2$cfclose (f);%1$c%2$csystem(comp_and_exec);%1$c%2$creturn (0);%1$c}%1$c"
int main (void)
{
	int i = 5;
	if (i <= 0)
		return (0);
	char name[16];
	char comp_and_exec[64];
	snprintf(name, 16, "Sully_%d.c", i - 1);
	snprintf(comp_and_exec, 64, "gcc %s -o Sully_%d && ./Sully_%d", name, i - 1, i - 1);
	FILE *f = fopen(name, "w");
	if (!f)
		return (1);
	fprintf(f, CODE, 10, 9, 34, i - 1, CODE);
	fclose (f);
	system(comp_and_exec);
	return (0);
}
