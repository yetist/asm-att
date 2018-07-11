#!/bin/bash
qemu-riscv64 -g 2323 ./quicksort &

# Well it seems like GDB really hates me and doesn't want me to debug stuff quickly :)
riscv64-linux-gnu-gdb \
    -ex "target remote :2323" \
    -ex "display $a0" \
    -ex "display $a2" \
    -ex "display $a3" \
    -ex "display $t5" \
    -ex "display $s10" \
    -ex "display $s11" \
    quicksort
