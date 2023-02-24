# alsl.w[u]/d  rd, rj, rk, sa2         # rd = rj * 2 * sa2 + rk

.text
    .globl main
main:
# 32 bit
    li.d          $s0, 0x11223344             # $s0 = 287454020(0x11223344) = 0b 0001 0001 0010 0010 0011 0011 0100 0100
    li.d          $s1, 0x11111111             # $s1 = 286331153(0x11111111) = 0b 0001 0001 0001 0001 0001 0001 0001 0001

    li.w          $s6, 1
    sll.w       $s5, $s0, $s6               # s5 = s0 << $s6; s5 = 0x22446688
    alsl.w      $s2, $s0, $s1, 1            # tmp = $s0 << 1 = $s0 * 2 = 0x22446688; $s2 = 0x22446688 + 0x11111111 = 0x33557799
    bl          regdump
    alsl.wu     $s2, $s0, $s1, 1            # tmp = $s0 << 1 = $s0 * 2 = 0x22446688; $s2 = 0x22446688 + 0x11111111 = 0x33557799
    bl          regdump

    li.w          $s6, 2
    sll.w       $s5, $s0, $s6               # s5 = s0 << $s6; s5 = 0x4488cd10
    alsl.w      $s2, $s0, $s1, 2            # tmp = $s0 << 2 = $s0 * 4 = 0x4488cd10; $s2 = 0x4488cd10 + 0x11111111 = 0x5599de21
    bl          regdump
    alsl.wu     $s2, $s0, $s1, 2            # tmp = $s0 << 2 = $s0 * 4 = 0x4488cd10; $s2 = 0x4488cd10 + 0x11111111 = 0x5599de21
    bl          regdump

# 64 bit
    li.d         $s0, 0x1234567811223344
    li.d         $s1, 0x1111111111111111

    li.w          $s6, 1
    sll.d       $s5, $s0, $s6               # s5 = s0 << $s6; s5 = 0x2468acf022446688
    alsl.d      $s2, $s0, $s1, 1            # tmp = $s0 << 1 = $s0 * 2 = 0x2468acf022446688; $s2 = 0x2468acf022446688 + 0x1111111111111111 = 0x3579be0133557799
    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
