/* void bzero(void *s, size_t n); */
bzero:
      sltiu  v0,a1,8        # if ( n < 8 ); then v0 = 1; else v0 = 0; fi
      beqz   v0,ge_8        # if ( n >= 8 ); then ge_8; fi
      andi   v0,a0,0x7      # v0 = s && b0111(0x7)

less_8:
      beqz   a1, exit       # if (n == 0); then exit; fi

      li     v0,1           # v0 = 1
      beq    a1,v0,exit     # if (n == 1); then exit; fi
      sb     zero,0(a0)     # *s = 0

      li     v0,2           # v0 = 2
      beq    a1,v0,exit     # if (n == 2); then exit; fi
      sb     zero,1(a0)     # *(s+1) = 0

      li     v0,3           # v0 = 3
      beq    a1,v0,exit     # if (n == 3); then exit; fi
      sb     zero,2(a0)     # *(s+2) = 0

      li     v0,4           # v0 = 4
      beq    a1,v0,exit     # if (n == 4); then exit; fi
      sb     zero,3(a0)     # *(s+3) = 0

      li     v0,5           # v0 = 5
      beq    a1,v0,exit     # if (n == 5); then exit; fi
      sb     zero,4(a0)     # *(s+4) = 0

      li     v0,7           # v0 = 7
      bne    a1,v0,exit     # if (n == 7); then exit; fi
      sb     zero,5(a0)     # *(s+5) = 0

      jr     ra
      sb     zero,6(a0)     # *(s+6) = 0

loop:
      sb     zero,0(a0)     # *s = 0
      daddiu a1,a1,-1       # n = n - 1
      daddiu a0,a0,1        # s = s + 1
      andi   v0,a0,0x7      # v0 = s && b0111(0x7)

ge_8:
      bnez   v0,loop        # if (v0 != 0); then loop;fi
      dsrl   a2,a1,0x6      # a2 = n >> (0x6 % 64) = n >> 6 = n / 64
      beqz   a2,less_64     # if (a2 == 0); then less_64; fi
      nop
      move   v1,a2          # v1 = a2
      move   v0,a0          # v0 = a0

ge_64:
      sd     zero,0(v0)     # *s = 0x0
      daddiu v1,v1,-1       # v1 = v1 - 1
      daddiu v0,v0,64       # v0 = v0 + 64
      sd     zero,-56(v0)   # *(s + 8) = 0x0
      sd     zero,-48(v0)   # *(s + 16) = 0x0
      sd     zero,-40(v0)   # *(s + 24) = 0x0
      sd     zero,-32(v0)   # *(s + 32) = 0x0
      sd     zero,-24(v0)   # *(s + 40) = 0x0
      sd     zero,-16(v0)   # *(s + 48) = 0x0
      bnez   v1,ge_64       # if (v1 != 0); then ge_64; fi
      sd     zero,-8(v0)    # *(s + 56) = 0x0

      dsll   a2,a2,0x6      # a2 = (long long) a2 << (0x6 % 64); a2 = a2 * 64
      daddu  a0,a2,a0       # a0 = a2 + a0

less_64:
      dext   a2,a1,0x3,0x3  # a2 = a1[(0x3+0x3)..0x3] = a1[6:3]
      beqz   a2,L6          # if (a2 == 0); then L6; fi
      nop
      move   v1,a2          # v1 = a2
      move   v0,a0          # v0 = a0
L7:
      daddiu v1,v1,-1       # v1 = v1 - 1
      sd     zero,0(v0)     # *s = 0
      bnez   v1,L7          # if (v1 != 0);then L7;fi
      daddiu v0,v0,8        # v0 += 8
      dsll   a2,a2,0x3      # a2 *= 8
      daddu  a0,a0,a2       # a0 += a2
L6:
      b      less_8
      andi   a1,a1,0x7      # a1 = a1 & 0x7
exit:
      jr     ra
      nop
