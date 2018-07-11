# 寄存器

寄存器    | ABI 接口名称| 描述                       | 在调用中是否保留？
:-------- | :---------- | :---------------           | ------
x0        | zero        | 硬编码0，忽略写入          | _n/a_
x1        | ra          | 返回地址                   | no
x2        | sp          | 栈指针                     | yes
x3        | gp          | 全局指针                   | _n/a_
x4        | tp          | 线程指针                   | _n/a_
x5        | t0          | 临时寄存器0/备用链接寄存器 | no
x6        | t1          | 临时寄存器1                | no
x7        | t2          | 临时寄存器2                | no
x8        | s0/fp       | 保存寄存器0或帧指针        | yes
x9        | s1          | 保存寄存器1                | yes
x10       | a0          | 返回值或函数参数0          | no
x11       | a1          | 返回值或函数参数1          | no
x12       | a2          | 函数参数2                  | no
x13       | a3          | 函数参数3                  | no
x14       | a4          | 函数参数4                  | no
x15       | a5          | 函数参数5                  | no
x16       | a6          | 函数参数6                  | no
x17       | a7          | 函数参数7                  | no
x18       | s2          | 保存寄存器2                | yes
x19       | s3          | 保存寄存器3                | yes
x20       | s4          | 保存寄存器4                | yes
x21       | s5          | 保存寄存器5                | yes
x22       | s6          | 保存寄存器6                | yes
x23       | s7          | 保存寄存器7                | yes
x24       | s8          | 保存寄存器8                | yes
x25       | s9          | 保存寄存器9                | yes
x26       | s10         | 保存寄存器10               | yes
x27       | s11         | 保存寄存器11               | yes
x28       | t3          | 临时寄存器3                | no
x29       | t4          | 临时寄存器4                | no
x30       | t5          | 临时寄存器5                | no
x31       | t6          | 临时寄存器6                | no
pc        | _(none)_    | 程序计数器                 | _n/a_
:-------- | :---------- | :---------------           | ------
f0-7      | ft0-7       | 浮点临时寄存器             | no
f8-9      | fs0-1       | 浮点保存寄存器             | yes
f10-11    | fa0-1       | 浮点参数/返回值            | no
f12-17    | fa2-7       | 浮点参数                   | no
f18-27    | fs2-11      | 浮点保存寄存器             | yes
f28-31    | ft8-11      | 浮点临时寄存器             | no

# 伪指令

RISC-V特定和GNU。前缀选项。

下表列出了汇编程序指令：

指令         | 参数                             | 描述
：---------- | ：-------------                  | ：---------------
.align       | 整数                             | 对齐2的幂（.p2align的别名）
.file        | “文件名”                         | emit filename FILE LOCAL符号表
.globl       | symbol_name                      | 将symbol_name发送到符号表（范围GLOBAL）
.local       | symbol_name                      | 将symbol_name发送到符号表（范围LOCAL）
.comm        | symbol_name，size，align         | 将公共对象发送到.bss部分
.common      | symbol_name，size，align         | 将公共对象发送到.bss部分
.ident       | “string”                         | 接受源兼容性
.section     | [{.text,.data,.rodata,.bss}]     | 发出部分（如果不存在，默认.text）并使其成为当前
.size        | 符号，符号                       | 接受源兼容性
.text        |                                  | 发出.text段（如果不存在）并使其成为当前的
.data        |                                  | 发出.data部分（如果不存在）并使其成为当前的
.rodata      |                                  | 发出.rodata部分（如果不存在）并使其成为当前的
.bss         |                                  | 发出.bss部分（如果不存在）并使其成为当前的
.string      | “string”                         | 发出字符串
.asciz       | “string”                         | 发出字符串（.string的别名）
.equ         | 名称，值                         | 常量定义
.macro       | name arg1 [，argn]               | 开始宏定义 \argname 替换
.endm        |                                  | 结束宏定义
.type        | 符号, @function                  | 接受源兼容性
.option      | {rvc,norvc,pic,nopic,push,pop}   | RISC-V选项
.byte        | 表达式[，表达式] *               | 8位逗号分隔的单词
.2byte       | 表达式[，表达式] *               | 16位逗号分隔的单词
.half        | 表达式[，表达式] *               | 16位逗号分隔的单词
.short       | 表达式[，表达式] *               | 16位逗号分隔的单词
.4byte       | 表达式[，表达式] *               | 32位逗号分隔的单词
.word        | 表达式[，表达式] *               | 32位逗号分隔的单词
.long        | 表达式[，表达式] *               | 32位逗号分隔的单词
.8byte       | 表达式[，表达式] *               | 64位逗号分隔的单词
.dword       | 表达式[，表达式] *               | 64位逗号分隔的单词
.quad        | 表达式[，表达式] *               | 64位逗号分隔的单词
.dtprelword  | 表达式[，表达式] *               | 32位线程本地字
.dtpreldword | 表达式[，表达式] *               | 64位线程本地字
.sleb128     | 表达式                           | 带符号小端基于128，DWARF
.uleb128     | 表达式                           | 无符号小端基于128，DWARF
.p2align     | p2，[pad_val = 0]，max           | 与2的力量对齐
.balign      | b，[pad_val = 0]                 | 字节对齐
.zero        | 整数                             | 零字节

## 汇编程序重定位函数

下表列出了汇编程序重定位扩展：

汇编符号                    | 说明                           | 指令/宏
:----------------------     | :---------------               | :-------------------
%hi(symbol)                 | 绝对 (HI20)                    | lui
%lo(symbol)                 | 绝对 (LO12)                    | load, store, add
%pcrel_hi(symbol)           | PC-相对 (HI20)                 | auipc
%pcrel_lo(label)            | PC-相对 (LO12)                 | load, store, add
%tprel_hi(symbol)           | TLS LE "Local Exec"            | lui
%tprel_lo(symbol)           | TLS LE "Local Exec"            | load, store, add
%tprel_add(symbol)          | TLS LE "Local Exec"            | add
%tls_ie_pcrel_hi(symbol) \* | TLS IE "Initial Exec" (HI20)   | auipc
%tls_gd_pcrel_hi(symbol) \* | TLS GD "Global Dynamic" (HI20) | auipc
%got_pcrel_hi(symbol) \*    | GOT PC-相对 (HI20)             | auipc


\ *这些重复使用％pcrel_lo（label）作为下半部分


## 依赖于 x0 的 RISC-V 伪指令。

伪指令                | 基本指令                           | 含义
:-------------------  | :---------------                   | :-------------------
nop                    addi x0, x0, 0                       空操作
neg rd, rs             sub rd, x0, rs                       2的补码
negw rd, rs            subw rd, x0, rs                      2的补码字
--------------------------------------------------------------------
snez rd, rs            sltu rd, x0, rs                      不等于0则置位
sltz rd, rs            slt rd, rs, x0                       小于0则置位
sgtz rd, rs            slt rd, x0, rs                       大于0则置位
--------------------------------------------------------------------
beqz rs, offset        beq rs, x0, offset                   不等于0则分支
bnez rs, offset        bne rs, x0, offset                   等于0则分支
blez rs, offset        bge x0, rs, offset                   小于等于0则分支
bgez rs, offset        bge rs, x0, offset                   大于等于0则分支
bltz rs, offset        blt rs, x0, offset                   小于0则分支
bgtz rs, offset        blt x0, rs, offset                   大于0则分支
--------------------------------------------------------------------
j offset               jal x0, offset                       转移
jr rs                  jalr x0, rs, 0                       转移到寄存器
ret                    jalr x0, x1, 0                       从子过程返回
--------------------------------------------------------------------
tail offset            auipc x6, offset[31:12]              跟踪调用远程子过程
                       jalr x0, x6, offset[11:0]
--------------------------------------------------------------------
rdinstret[h] rd        csrrs rd, instret[h], x0             读取过时指令计数器
rdcycle[h] rd          csrrs rd, cycle[h], x0               读取周期计数器
rdtime[h] rd           csrrs rd, time[h], x0                读取实时时钟
--------------------------------------------------------------------
csrr rd, csr           csrrs rd, csr, x0                    读 CSR 寄存器
csrw csr, rs           csrrs x0, csr, rs                    写 CSR 寄存器
csrs csr, rs           csrrs x0, csr, rs                    CSR 寄存器置零位
csrc csr, rs           csrrs x0, csr, rs                    CSR 寄存器清除
--------------------------------------------------------------------
csrwi csr, imm         csrrwi x0, csr, imm                  立即数写入 CSR
csrsi csr, imm         csrrsi x0, csr, imm                  立即数置位 CSR
csrci csr, imm         csrrci x0, csr, imm                  立即数清除 CSR
--------------------------------------------------------------------
frcsr rd               csrrs rd, fcsr, x0                   读取 FP 控制/状态寄存器
fscsr rs               csrrw x0, fcsr, rs                   写入 FP 控制/状态寄存器
--------------------------------------------------------------------
frrm rd                csrrs rd, frm, x0                    读取 FP 舍入模式
fsrm rd                csrrw x0, frm, rs                    写入 FP 舍入模式
--------------------------------------------------------------------
frflags rd             csrrs rd, fflags, x0                  读取 FP 例外标志
fsflags rs             csrrw x0, fflags, rs                  写入 FP 例外标志
--------------------------------------------------------------------



## 不依赖于 x0 寄存器的 RISC-V 伪指令

伪指令                           | 基本指令                           | 含义
:------------------------------  | :---------------                   | :-------------------
lla rd, symbol                     auipc rd, symbol[31:12]              取局部地址
                                   addi rd, rd, symbol[11:0]
--------------------------------------------------------------------------------
la rd, symbol                      PIC: auipc rd, GOT[symbol][31:12]    取地址
                                   l{w|d} rd, rd GOT[symbol][11:0]
                                   Non-PIC: 同 lla rd, symbol
--------------------------------------------------------------------------------
l{b|h|w|d} rd, symbol              auipc rd, symbol[31:12]              加载全局
                                   l{b|h|w|d} rd, symbol[11:0](rd)
--------------------------------------------------------------------------------
s{b|h|w|d} rd, symbol, rt          auipc rt, symbol[31:12]              保存全局
                                   s{b|h|w|d} rd, symbol[11:0](rt)
--------------------------------------------------------------------------------
fl{w|d} rd, symbol, rt             auipc rt, symbol[31:12]              浮点加载全局
                                   fl{w|d} rd, symbol[11:0](rt)
--------------------------------------------------------------------------------
fs{w|d} rd, symbol, rt             auipc rt, symbol[31:12]              浮点保存全局
                                   fs{w|d} rd, symbol[11:0](rt)
--------------------------------------------------------------------------------
li rd, immediate                   无数的序列                           加载立即数
mv rd, rs                          addi rd, rs, 0                       复制寄存器
not rd, rs                         xori rd, rs, -1                      1的补码
sext.w rd, rs                      addiw rd, rs, x0                     符号扩展字
seqz rd, rs                        sltiu rd, rs, 1                      等于0则置位
--------------------------------------------------------------------------------
fmv.s rd, rs                       fsgnj.s rd, rs, rs                   复制单精度寄存器
fabs.s rd, rs                      fsgnjx.s rd, rs, rs                  单精度绝对值
fneg.s rd, rs                      fsgnjn.s rd, rs, rs                  单精度负值
fmv.d rd, rs                       fsgnj.d rd, rs, rs                   复制双精度寄存器
fabs.d rd, rs                      fsgnjx.d rd, rs, rs                  双精度绝对值
fneg.d rd, rs                      fsgnjn.d rd, rs, rs                  双精度负值
--------------------------------------------------------------------------------
bgt rs, rt, offset                 blt rt, rs, offset                   小于时转移
ble rs, rt, offset                 bge rt, rs, offset                   小于等于时转移
bgtu rs, rt, offset                bltu rt, rs, offset                  无符号大于时转移
bleu rs, rt, offset                bgeu rt, rs, offset                  无符号小于等于时转移
--------------------------------------------------------------------------------
jal offset                         jal x1, offset                       转移并连接
jalr rs                            jalr x1, rs, 0                       转移并连接寄存器
--------------------------------------------------------------------------------
call offset                        auipc x6, offset[31:12]              远程调用子过程
                                   jalr x1, x6, offset[11:0]
--------------------------------------------------------------------------------
fence                              fence iorw, iorw                     内存和I/O 屏障
--------------------------------------------------------------------------------
fscsr rd, rs                       csrrw rd, fcsr, rs                  交换FP控制/状态寄存器
fsrm rd, rs                        csrrw rd, frm, rs                   交换FP舍入模式
fsflags rd, rs                     csrrw rd, fflags, rs                交换FP例外标志
--------------------------------------------------------------------------------
