/*
 * GCC 内联汇编示例
 */
#include <string.h>
#include <stdio.h>

int main() {
	char* str = "Hello World\n";
	long len = strlen(str);
	int ret = 0;

#ifdef __x86_64__
	__asm__("movq $1, %%rax \n\t"
		"movq $1, %%rdi \n\t"
		"movq %1, %%rsi \n\t"
		"movl %2, %%edx \n\t"
		"syscall"
		: "=g"(ret)
		: "g"(str), "g" (len));
#endif

    printf("ret=%d\n", ret);

	return 0;
}
