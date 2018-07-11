/*
 * C 实现 print 函数，被汇编调用
 */
#include <stdio.h>

extern int print();

int print() {
	printf("Hello World\n");
	return 0;
}
