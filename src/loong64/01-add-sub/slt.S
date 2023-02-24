# slt[u][i]

.text
    .globl main
main:
    li.w          $s0, -3
    li.w          $s1, 8
    slt         $s2, $s0, $s1       # if s0 < s1, s2 = 1
    bl          regdump
    sltu        $s2, $s0, $s1       # s0 = unsigned(0xfffffffffffffffd) = dec(18446744073709551613);
    bl          regdump

    slti        $s2, $s0, 8         # if s0 < 8, s2 = 1
    bl          regdump
    sltui       $s2, $s0, 8         # if s0 < 8, s2 = 1
    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
