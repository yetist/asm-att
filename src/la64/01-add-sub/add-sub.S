# add.w/d, sub.w/d

.text
    .globl main
main:
# 32 bit
    li          $s0, 0x12345678     # 相当于 lu12i.w $s0, 0x12345; ori $s0, $s0, 0x678
    li          $s1, 0x11111111
    bl          regdump
    add.w       $s2, $s0, $s1
    bl          regdump

    li          $s0, 0x12345678
    li          $s1, 0x11111111
    bl          regdump
    sub.w       $s2, $s0, $s1
    bl          regdump

# 64 bit
    dli         $s0, 0x1234567811223344    # 相当于以下4条语句：
                                           # lu12i.w $s0, 0x11223
                                           # ori     $s0, $s0, 0x344
                                           # lu32i.d $s0, 0x45678
                                           # lu52i.d $s0, $s0, 0x123
    dli         $s1, 0x1111111111111111
    bl          regdump
    add.d       $s2, $s0, $s1
    bl          regdump

    dli         $s0, 0x1234567811223344
    dli         $s1, 0x1111111111111111
    bl          regdump
    sub.d       $s2, $s0, $s1
    bl          regdump

# exit
    li          $a0, 0
    bl          %plt(exit)

#    li          $a0, 0
#    li          $a7, 93
#    syscall     0x0
