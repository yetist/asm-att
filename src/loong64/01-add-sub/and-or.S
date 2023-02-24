# and, or, nor, xor, andn, orn

.text
    .globl main
main:
# 32 bit
    li.w          $s0, 0x156                  # $s0 = 0b0001 0101 0110 = 0x156
    li.w          $s1, 0xfff                  # $s1 = 0b1111 1111 1111 = 0xfff
    li.w          $s2, 0x10e                  # $s2 = 0b0001 0000 1110 = 0x10e

    and         $s3, $s0, $s1               # $s3 = s0 & s1
    and         $s4, $s0, $s2               # $s4 = s0 & s2
    or          $s5, $s0, $s1               # $s5 = s0 | s1
    or          $s6, $s0, $s2               # $s6 = s0 | s2
    nor         $s7, $s0, $s1               # $s7 = ~(s0 | s1)
    nor         $s8, $s0, $s2               # $s8 = ~(s0 | s2)

    bl          regdump                     # $s3 = 0b0001 0101 0110 = 0x156
                                            # $s4 = 0b0001 0000 0110 = 0x106
                                            # $s5 = 0b1111 1111 1111 = 0xfff
                                            # $s6 = 0b0001 0101 1110 = 0x15e
                                            # $s7 = ~(0b1111 1111 1111) = 0xfffffffffffff000
                                            # $s6 = ~(0b0001 0101 1110) = 0xfffffffffffffea1

    xor         $s3, $s0, $s1               # $s3 = s0 ^ s1
    xor         $s4, $s0, $s2               # $s4 = s0 ^ s2
    andn        $s5, $s0, $s1               # $s5 = s0 & (~s1) = 0b0001 0101 0110 & 0b0000 0000 0000
    andn        $s6, $s0, $s2               # $s6 = s0 & (~s2) = 0b0001 0101 0110 & 0b1110 1111 0001
    orn         $s7, $s0, $s1               # $s7 = s0 | (~s1) = 0b0001 0101 0110 | 0b0000 0000 0000
    orn         $s8, $s0, $s2               # $s8 = s0 | (~s2) = 0b0001 0101 0110 | 0b1110 1111 0001

    bl          regdump                     # $s3 = 0b1110 1010 1001 = 0xea9
                                            # $s4 = 0b0000 0101 1000 = 0x58
                                            # $s5 = 0x156 & 0x0 = 0x0
                                            # $s6 = 0x156 & 0xef1 = 0x50
                                            # $s7 = 0x156 | 0x0 = 0x156
                                            # $s8 = 0x156 | 0xef1 = 0xff7

    andi        $s3, $s0, 0xfff             # $s3 = s0 & s1 = 0x156
    andi        $s4, $s0, 0x10e             # $s4 = s0 & s2 = 0x106
    ori         $s5, $s0, 0xfff             # $s5 = s0 | s1 = 0xfff
    ori         $s6, $s0, 0x10e             # $s6 = s0 | s2 = 0x15e
    xori        $s7, $s0, 0xfff             # $s7 = s0 ^ s1 = 0xea9
    xori        $s8, $s0, 0x10e             # $s8 = s0 ^ s2 = 0x58
    bl          regdump

    nop                                     # andi $zero, $zero, 0

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
