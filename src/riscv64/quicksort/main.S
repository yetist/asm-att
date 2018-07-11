.section .rodata
    .include "../common/define.inc"
    .equ _SYS_WR, 64    # write syscall number

.include "quicksort.S"

.section .rodata
    arrsize: .byte 7
    # arrsize2: .byte 20

.section .data
    testarray: .byte 5,1,3,7,8,10,6
    # testarray2: .byte 7,3,5,8,5,12,250,1,99,2,54,34,23,65,13,24,75,37,88,77

.section .text
    .globl _start
_start:
    la   a1, testarray      #la: 加载地址，         a1 = &testarray
    li   a2, 0              #li: 加载立即数，       a2 = 0
    lbu  a3, arrsize        #lbu: 加载无符号字节，  a3 = 7
    addi a3, a3, -1         #addi: 立即数加，       a3 = a3 -1
    jal  ra, quicksort      #jal: 转移并链接,       call quicksort

    # STOP EXECUTION
    li   a7, SYS_exit
	ecall
