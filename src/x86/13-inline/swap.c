/* inline.c */
#include <stdio.h>

int main()
{
	int a = 10, b = 0;
	__asm__ __volatile__("movl %1, %%eax;\n\r"
			"movl %%eax, %0;"
			:"=r"(b)      /* 输出，%0，r-任意寄存器 */
			:"r"(a)       /* 输入，%1, 任意寄存器 */
			:"%eax");     /* 不受影响的寄存器 */

	printf("Result: %d, %d\n", a, b);
}
