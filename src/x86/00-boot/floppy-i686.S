/*
vi: set expandtab:
这是引导扇区代码, 16 位 DOS 实模式汇编

编译方法：
as -o boot.o boot.s
ld -Ttext=0x7c00 --oformat binary -o boot.bin boot.o
dd if=/dev/zero of=emptydisk.img bs=512 count=2880
dd if=boot.bin of=floppy.img bs=512 count=1
dd if=emptydisk.img of=floppy.img skip=1 seek=1 bs=512 count=2879
*/

.code16                                         # 使用16位模式汇编(GAS 默认认为 .S 文件是 pure 32-bits i386 code)
.section .text                                  # 代码段开始(为 link script 做定位)
    jmp LABEL_START                             # 跳转指令，用于跳过以下的扇区信息
    nop
BS_OEMName:         .ascii  "Xiaotian"          # 厂商名，8 bytes，偏移 3 bytes
BPB_BytsPerSec:     .2byte  512                 # Offset=3, size=2, sector size
BPB_SecPerCluster:  .byte   1                   # FAT12 is 1
BPB_ResvdSecCnt:    .2byte  1                   # FAT12/16 is 1
BPB_NumFATs:        .byte   2                   # FAT Table numbers, 2
BPB_RootEntCnt:     .2byte  224                 # FAT12 is 224
BPB_TotSec16:       .2byte  2880                # 1.44M floppy is 2880
BPB_Media:          .byte   0xf0                # 1.44M floppy is 0xF0
BPB_FATSz16:        .2byte  9
BPB_SecPerTrk:      .2byte  18
BPB_NumHeads:       .2byte  2
BPB_HiddSec:        .4byte  0
BPB_TotSec32:       .4byte  0
BS_DrvNum:          .byte   0
BS_Reserved1:       .byte   0
BS_BootSig:         .byte   0x29
BS_VolID:           .4byte  0
BS_VolLab:          .ascii  "Floppy disk"
BS_FileSysType:     .ascii  "FAT12 "
LABEL_START:
    movw %cs, %ax                               /* Initial registers. */
    movw %ax, %ds
    movw %ax, %es
    call ClearScreen
    call PrintString                            # 调用显示字符串例程
loop1:
    jmp loop1                                   # 无限循环(GAS 没有 $ 作为当前行标号的约定)

ClearScreen:
    movb $0x06, %ah
    movb $0, %al                                # 清窗口

    movb $0, %ch                                # 左上角的行号
    movb $0, %cl                                # 左上角的列号
    movb $24, %dh                               # 右下角的行号
    movb $79, %dl                               # 右下角的列号
    movb $0x07, %bh                             # 属性为黑底白字
    int $0x10
    ret

PrintString:
    movw $BootMessage, %ax
    movw %ax, %bp                               # ES:BP = 串地址
    movw $0xd, %cx                              # CX = 串长度
    movw $0x1301, %ax                           # AH = 13, AL = 01h
    movw $0xc, %bx                              # 页号为0(BH = 0) 黑底红字(BL = 0Ch,高亮)
    movw $0, %dx                                # DH = 0, DL = 0, 坐标
    int $0x10                                   # 10h 号中断
    ret

BootMessage:
    .ascii "Loading OS..."
    .org 510                                    # 填充到 510 字节，使生成的二进制代码恰好为512字节
    .word 0xAA55                                # 结束标志
