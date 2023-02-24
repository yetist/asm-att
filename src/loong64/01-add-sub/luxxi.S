# lu12i.w
# lu32i.w
# lu52i.w

.text
    .globl main
main:
    li.d          $s0, 0x1122334412345678
    # 等于下面4条语句
    lu12i.w      $s1, 0x12345
    ori          $s1, $s1, 0x678
    lu32i.d      $s1, 0x23344
    lu52i.d      $s1, $s1, 0x112

    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
