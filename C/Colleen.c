#include <stdio.h>

/*
	This is the outside comment
*/
char *get_code(void)
{
	return ("#include <stdio.h>%1$c%1$c/*%1$c%2$cThis is the outside comment%1$c*/%1$cchar *get_code(void)%1$c{%1$c%2$creturn (%3$c%4$s%3$c);%1$c}%1$c%1$cint main (void)%1$c{%1$c%2$c/*%1$c%2$c%2$cThis is the inside comment%1$c%2$c*/%1$c%2$cchar *code;%1$c%2$ccode = get_code();%1$c%2$cprintf(code, 10, 9, 34, code);%1$c%2$creturn (0);%1$c}%1$c");
}

int main (void)
{
	/*
		This is the inside comment
	*/
	char *code;
	code = get_code();
	printf(code, 10, 9, 34, code);
	return (0);
}
