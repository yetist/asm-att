# addi.w/d, addu16i.d

.text
    .globl main
main:
# 32 bit
    li.w          $s0, 0x11111111
    bl          regdump
    addi.w      $s1, $s0, 0x123             # s1 = 0x11111234
    bl          regdump

# 64 bit
    li.d         $s0, 0x1234567811223344
    bl          regdump
    addi.d      $s1, $s0, 0x111             # s1 = 0x1234567811223455
    bl          regdump

    li.d         $s0, 0x1111111111111111
    bl          regdump
    addu16i.d   $s1, $s0, 0x1234            # s1 = 0x1111111123451111
    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)

#    li          $a0, 0
#    li          $a7, 93
#    syscall     0x0
