# pcaddi    Program Counter Add Immediate

.section .rodata
msg0:
    .string ">>>>>>>>>>>>>>>>>> pcaddi <<<<<<<<<<<<<<<<<\n"
msg1:
    .string ">>>>>>>>>>>>>>>>>> pcaddu12i <<<<<<<<<<<<<<<<<\n"
msg2:
    .string ">>>>>>>>>>>>>>>>>> pcaddu18i <<<<<<<<<<<<<<<<<\n"
msg3:
    .string ">>>>>>>>>>>>>>>>>> pcalau12i <<<<<<<<<<<<<<<<<\n"

.text
    .globl main
main:
    la.local    $a0, msg0
    bl          println

    pcaddi      $s0, 0      #0x40000008cc -> 0x40 0000 08cc
    bl          regdump     #0x4000000880
    pcaddi      $s0, 0      #0x40000008d4 -> 0x40 0000 08d4
    bl          regdump     #0x40000008d8
    pcaddi      $s0, 1      #0x40000008dc -> pc + 1 * 4 = 0x40 0000 08e0
    bl          regdump
    pcaddi      $s0, 2      #0x40000008e4 -> pc + 2 * 4 = 0x40 0000 08ec
    bl          regdump
    pcaddi      $s0, -2     #0x40000008ec -> pc + (-2 * 4) = 0x40 0000 08e4
    bl          regdump

    la.local    $a0, msg1
    bl          println

    pcaddu12i   $s0, 0      #0x4000000900 -> 0x40 0000 0900
    bl          regdump     #0x4000000904
    pcaddu12i   $s0, 0      #0x4000000908 -> 0x40 0000 0908
    bl          regdump     #0x400000090c
    pcaddu12i   $s0, 1      #0x4000000910 -> pc + 0x40 0000 1000 = 0x40 0000 1910
    bl          regdump     #0x4000000914
    pcaddu12i   $s0, 2      #0x4000000918 -> pc + 0x40 0000 2000 = 0x40 0000 2918
    bl          regdump     #0x400000091c

    la.local    $a0, msg2
    bl          println

    pcaddu18i   $s0, 0      #0x400000092c -> 0x40 0000 092c
    bl          regdump     #0x4000000930
    pcaddu18i   $s0, 0      #0x4000000934 -> 0x40 0000 0934
    bl          regdump     #0x4000000938
    pcaddu18i   $s0, 1      #0x400000093c -> pc + 0x40 0004 0000 = 0x40 0004 093c
    bl          regdump     #0x4000000940
    pcaddu18i   $s0, 2      #0x4000000944 -> pc + 0x40 0008 0000 = 0x40 0008 0944
    bl          regdump     #0x4000000948

    la.local    $a0, msg3
    bl          println

    pcalau12i   $s0, 0      #0x4000000958 -> 0x40 0000 0958 & 0xff ffff f000 = 0x40 0000 0000
    bl          regdump     #0x400000095c
    pcalau12i   $s0, 0      #0x4000000960 -> 0x40 0000 0960 & 0xff ffff f000 = 0x40 0000 0000
    bl          regdump     #0x4000000964
    pcalau12i   $s0, 1      #0x4000000968 -> pc + 0x1000 = 0x4000001968 & 0xff ffff f000 = 0x40 0000 1000
    bl          regdump     #0x400000096c
    pcalau12i   $s0, 2      #0x4000000970 -> pc + 0x2000 = 0x4000002970 & 0xff ffff f000 = 0x40 0000 2000
    bl          regdump     #0x4000000974

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
