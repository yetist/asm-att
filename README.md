# 编译

编译方法

```
meson _build_<arch> --cross-file cross/linux-<arch>.txt
ninja -C _build_<arch> -v
```

```
meson _build_riscv --cross-file cross/linux-riscv64.txt
ninja -C _build_riscv -v
./_build_riscv_2/riscv64/hello/hello
```

## x86_64 函数

传参：

- rdi - 第一个参数
- rsi - 第二个参数
- rdx - 第三个参数
- rcx - 第四个参数
- r8 - 第五个参数
- r9 - 第六

## qemu user mode

echo ':qemu-riscv64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv64:' > /proc/sys/fs/binfmt_misc/register
或
echo ':qemu-riscv64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv64:' > /etc/binfmt.d/qemu-riscv64.conf
echo ':qemu-loongarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-loongarch64:' > /etc/binfmt.d/qemu-loongarch64.conf

alias riscv-gcc='riscv64-linux-gnu-gcc -Wl,-dynamic-linker /usr/riscv64-linux-gnu/lib/ld-linux-riscv64-lp64d.so.1 -Wl,-rpath=/usr/riscv64-linux-gnu/lib/ -lc'
alias aarch64-gcc='aarch64-linux-gnu-gcc -Wl,-dynamic-linker /usr/aarch64-linux-gnu/lib/ld-linux-aarch64.so.1 -Wl,-rpath=/usr/aarch64-linux-gnu/lib -lc'

## debug

qemu-xxx -g 1234 -singlestep ./a.out

gdb
> file ./a.out
> target remote localhost:1234
> c
