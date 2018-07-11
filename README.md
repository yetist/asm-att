# 编译

```
meson _build_i686 --cross-file cross/linux-i686.txt
ninja -C _build_i686 -v
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

## MIPS

如果不添加编译参数,则默认编译的目标文件为"mips32r2 mabi=32"

如果想要编译其它类型目标文件需要添加参数.

例如,如果需要编译mips64r2 n64的目标文件:

添加参数"-mips64r2 -mabi=64".

## qemu user mode

echo ':qemu-riscv64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv64:' > /proc/sys/fs/binfmt_misc/register
或
echo ':qemu-riscv64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-riscv64:' > /etc/binfmt.d/qemu-riscv64.conf
echo ':qemu-loongarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-loongarch64:' > /etc/binfmt.d/qemu-loongarch64.conf

## debug

qemu-xxx -g 1234 -singlestep ./a.out

gdb
> file ./a.out
> target remote localhost:1234
> c
