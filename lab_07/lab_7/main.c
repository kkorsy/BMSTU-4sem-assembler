#include <stdio.h>
#include <string.h>

#define N 15

extern char* _cdecl strcopy_asm(char *dst, char *src, int len);

int asm_len(char* s)
{
	int len = 0;
	__asm
	{
		push ECX
		push EDI
		cld

		mov ECX, -1
		mov EDI, s
		xor AL, AL

		repne scasb

		not ECX
		dec ECX
		mov len, ECX
		
		pop ECX
		pop EDI
		cld
	}

	return len;
}

int main(void)
{
	char s_1[] = "Test string";
	printf("Real len: %d\nAsm len: %d\n", strlen(s_1), asm_len(s_1));

	char s_2[] = "";
	printf("Real len: %d\nAsm len: %d\n", strlen(s_2), asm_len(s_2));


	char src_2[] = "String for copy";
	printf("Source str:\n\t%s\n", src_2);
	int len = strlen(src_2);
	char before[100] = { '0' },
		* middle = before + 4,
		* after = middle + 4;

	
	printf("Coppied string:\n\t%s\n", strcopy_asm(src_2, middle, len));
	printf("Copy before pointer:\n\t%s\n", strcopy_asm(middle, before, len));
	printf("Copy after pointer:\n\t%s\n", strcopy_asm(before, after, len));

	return 0;
}
