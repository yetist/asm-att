/*
   打印参数
#include <stdio.h>
int main(int argc, char** argv)
{
    int i;
    for (i = 0; i < argc; i++)
        printf("i:%d, arg:%s\n", i, argv[i]);
    return 0;
}
*/
.section    .rodata
    .include "../common/define.inc"
    .align  3
format:
	.string "i=%d, argv=%s\n"

.section .text
    .globl main
	.type	main, @function
main:
	addi	sp,sp,-48		    # sp = sp - 48
	sd		ra,40(sp)		    # sp[40] = ra
	sd		s0,32(sp)		    # sp[32] = s0
	addi	s0,sp,48		    # s0 = sp + 48 = old sp
	sw		a0,-36(s0)		    # sp[12] = a0 = argc
	sd		a1,-48(s0)		    # sp[0] = a1 = argv
	sw		zero,-20(s0)	    # sp[28] = 0, 保存i的值

loop:
	ld		a4,-48(s0)		    # a4 = sp[0] = argv

	lw		a5,-20(s0)		    # a5 = i
	slli	a5,a5,3			    # i = i * 8, 指针移动长度，slli: 立即数逻辑左移3位
	add		a5,a4,a5		    # a5 = argv + i*8
	ld		a2,0(a5)		    # a2 = *(argv+i)

	lw		a1,-20(s0)		    # a1 = i
	lui		a5,%hi(format)
	addi	a0,a5,%lo(format)	# a0 = format
	call	printf              # call printf(format, i, argv)

    # i = i + 1
	lw		a5,-20(s0)		    # a5 = i = load sp[28]
	addiw	a5,a5,1			    # a5 = a5 + 1
	sw		a5,-20(s0)		    # sp[28] = i

    /* if ( i < argc); goto loop */
	lw		a4,-20(s0)		    # a4 = sp[28] = i
	lw		a5,-36(s0)		    # a5 = sp[12] = a5 = a0 = argc
	sext.w	a4,a4               # 符号扩展int型i
	sext.w	a5,a5               # 符号扩展int弄argc
	blt		a4,a5,loop		    # i < argc, loop

    li      a0, 3               # a0 = 0, 设置返回值为0
	ld		ra,40(sp)           # restore ra
	ld		s0,32(sp)           # restore s0
	addi	sp,sp,48            # restore sp
	jr		ra
    .size   main, .-main
