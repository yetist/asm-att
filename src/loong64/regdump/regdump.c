/* vi: set sw=4 ts=4 sts=4 expandtab wrap ai: */
#include <stdio.h>
#include <stdint.h>

void regdump(void)
{
    uint64_t ra, tp, sp, fp;
    uint64_t a0, a1, a2, a3, a4, a5, a6, a7;
    uint64_t t0, t1, t2, t3, t4, t5, t6, t7, t8;
    uint64_t s0, s1, s2, s3, s4, s5, s6, s7, s8;

    __asm__ volatile (
            "move %[ra], $ra\n"
            "move %[tp], $tp\n"
            "move %[sp], $sp\n"
            "move %[fp], $fp\n"
            "move %[a0], $a0\n"
            "move %[a1], $a1\n"
            "move %[a2], $a2\n"
            "move %[a3], $a3\n"
            "move %[a4], $a4\n"
            "move %[a5], $a5\n"
            "move %[a6], $a6\n"
            "move %[a7], $a7\n"
            :
            [ra] "=r" (ra),
            [tp] "=r" (tp),
            [sp] "=r" (sp),
            [fp] "=r" (fp),
            [a0] "=r" (a0),
            [a1] "=r" (a1),
            [a2] "=r" (a2),
            [a3] "=r" (a3),
            [a4] "=r" (a4),
            [a5] "=r" (a5),
            [a6] "=r" (a6),
            [a7] "=r" (a7)
            );

    __asm__ volatile (
            "move %[t0], $t0\n"
            "move %[t1], $t1\n"
            "move %[t2], $t2\n"
            "move %[t3], $t3\n"
            "move %[t4], $t4\n"
            "move %[t5], $t5\n"
            "move %[t6], $t6\n"
            "move %[t7], $t7\n"
            "move %[t8], $t8\n"
            "move %[s0], $s0\n"
            "move %[s1], $s1\n"
            "move %[s2], $s2\n"
            "move %[s3], $s3\n"
            "move %[s4], $s4\n"
            "move %[s5], $s5\n"
            "move %[s6], $s6\n"
            "move %[s7], $s7\n"
            "move %[s8], $s8\n"
            :
            [t0] "=r" (t0),
            [t1] "=r" (t1),
            [t2] "=r" (t2),
            [t3] "=r" (t3),
            [t4] "=r" (t4),
            [t5] "=r" (t5),
            [t6] "=r" (t6),
            [t7] "=r" (t7),
            [t8] "=r" (t8),
            [s0] "=r" (s0),
            [s1] "=r" (s1),
            [s2] "=r" (s2),
            [s3] "=r" (s3),
            [s4] "=r" (s4),
            [s5] "=r" (s5),
            [s6] "=r" (s6),
            [s7] "=r" (s7),
            [s8] "=r" (s8)
            );
    printf("ra=%p\ttp=%p\tsp=%p\tfp=%p\n\n", ra, tp, sp, fp);
    printf("a0=%p\ta1=%p\ta2=%p\ta3=%p\n", a0, a1, a2, a3);
    printf("a4=%p\ta5=%p\ta6=%p\ta7=%p\n\n", a4, a5, a6, a7);

    printf("t0=%p\tt1=%p\tt2=%p\tt3=%p\tt4=%p\n", t0, t1, t2, t3, t4);
    printf("t5=%p\tt6=%p\tt7=%p\tt8=%p\n\n", t5, t6, t7, t8);

    printf("s0=%p\ts1=%p\ts2=%p\ts3=%p\ts4=%p\n", s0, s1, s2, s3, s4);
    printf("s5=%p\ts6=%p\ts7=%p\ts8=%p\n", s5, s6, s7, s8);

}

int main(int argc, char** argv)
{
    regdump();
    return 0;
}
