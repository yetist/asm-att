# RV32I

整数运算

add     # [R] add
addi    # [I] add immediate
sub     # [R] subtract

and     # [R] add
andi    # [I] add immediate
or      # [R] or
ori     # [I] or immediate
xor     # [R] exclusive or
xori    # [I] exclusive or immediate

sll     # [R] shift left logical
slli    # [I] shift left logical immediate
sra     # [R] shift right arithmetic
srai    # [I] shift right arithmetic immediate
srl     # [R] R shift right logical
srli    # [I] shift right logical immediate

lui     # [U] load upper immediate
auipc   # [U] add upper immediate to pc
slt     # [R] set less than
sltu    # [R] set less than unsigned
slti    # [I] set less than immediate
sltiu   # [I] set less than immediate unsigned

控制权转移

beq     # [B] branch equal
bne     # [B] branch not equal

bge     # [B] branch greater than or equal
bgeu    # [B] branch greater than or equal unsigned
blt     # [B] branch less than
bltu    # [B] branch less than unsigned

jal     # [J] jump and link
jalr    # [J] jump and link register

加载和存储

lb      # [I] load byte
lh      # [I] load harfword
lw      # [I] load word

sb      # [S] store byte
sh      # [S] store harfword
sw      # [S] store word

lbu     # [I] load byte unsigned
lhu     # [I] load harfword unsigned

杂项说明

fence   # [I] fence loads & stores
fenci.i # [I] fence instruction & data

ebreak  # [I] environment break
ecall   # [I] environment call

csrrc   # [I] control status register read & clear bit
csrrci  # [I] control status register read & clear bit immediate
csrrs   # [I] control status register read & set bit
csrrsi  # [I] control status register read & set bit immediate
csrrw   # [I] control status register read & write bit
csrrwi  # [I] control status register read & write bit immediate


# RISCV 整数和浮点寄存器的汇编助记符

寄存器      接口名称    描述                        在调用中是否保留
x0          zero        硬编码0                     ---
x1          ra          返回地址                    No
x2          sp          栈指针                      Yes
x3          gp          全局指针                    ---
x4          tp          线程指针                    ---
x5          t0          临时寄存器/备用链接寄存器   No
x6-7        t1-2        临时寄存器                  No
x8          s0/fp       保存寄存器/帧指针           Yes
x9          s1          保存寄存器                  Yes
x10-11      a0-1        函数参数/返回值             No
x12-17      a2-7        函数参数                    No
x18-27      s2-11       保存寄存器                  Yes
x28-31      t3-6        临时寄存器                  No

f0-7        ft0-7       浮点临时寄存器              No
f8-9        fs0-1       浮点保存寄存器              Yes
f10-11      fa0-1       浮点参数/返回值             No
f12-17      fa2-7       浮点参数                    No
f18-27      fs2-11      浮点保存寄存器              Yes
f28-31      ft8-11      浮点临时寄存器              No

# 伪指令

依赖于 x0 的 RISC-V 伪指令

nop                 addi x0, x0, 0              无操作
neg  rd, rs         sub  rd, x0, rs             补码
negw rd, rs         subw rd, x0, rs             字的补码

snez rd, rs         sltu rd, x0, rs             非0则置位
sltz rd, rs         slt  rd, rs, x0             小于0则置位
sgtz rd, rs         slt  rd, x0, rs             大于0则置位

beqz rs, offset     beq rs, x0, offset          为0则转移
bnez rs, offset     bne rs, x0, offset          非0则转移
blez rs, offset     bge x0, rs, offset          小于等于0则转移
bgez rs, offset     bge rs, x0, offset          大于等于0则转移
bltz rs, offset     blt rs, x0, offset          小于0则转移
bgtz rs, offset     blt x0, rs, offset          大小0则转移

j offset            jal x0, offset              跳转
jr rs               jalr x0, rs, 0              寄存器跳转
ret                 jalr x0, x1, 0              从子过程返回

tail offset         juipc x6, offset[31:12]     尾调用远程子过程
                    jalr  x0, x6, offset[11:0]

rdinstret[h] rd     csrrs rd, instret[h], x0    读取过时指令计数器
rdcycle[h] rd       csrrs rd, cycle[h], x0      读取周期计数器
rdtime[h] rd        csrrs rd, time[h], x0       读取实时时钟

csrr rd, csr        csrrs rd, csr, x0           读CSR寄存器
csrw csr, rs        csrrw x0, csr, rs           写CSR寄存器
csrs csr, rs        csrrs x0, csr, rs           CSR寄存器置零位
csrc csr, rs        csrrc x0, csr, rs           CSR寄存器清除

csrwi csr, imm      csrrwi x0, csr, imm         立即数写入 CSR
csrsi csr, imm      csrrsi x0, csr, imm         立即数置位 CSR
csrci csr, imm      csrrci x0, csr, imm         立即数清除 CSR

frcsr rd            csrrs rd, fcsr, x0          读取FP控制/状态寄存器
fscsr rs            csrrw x0, fcsr, rs          写入FP控制/状态寄存器

frrm rd             csrrs rd, frm, x0           读取FP舍入模式
fsrm rs             csrrw x0, frm, rs           写入FP舍入模式

frflags rd          csrrs rd, fflags, x0        读取FP例外标志
fsflags rs          csrrw x0, fflags, rs        写入FP例外标志


不依赖于 x0 寄存器的 RISC-V 伪指令

lla rd, symbol              auipc rd, symbol[31:12]                     取局部地址
                            addi rd, rd, symbol[11:0]

la rd, symbol               PCI: auipc rd, GOT[symbol][31:12]           取地址
                            l{w|d} rd, rd, GOT[symbol][11:0]
                            Non-PIC: same as lla rd, symbol

l{b|h|w|d} rd, symbol       auipc rd, symbol[31:12]                     读取全局量
                            l{b|h|w|d} rd, symbol[11:0](rd)

s{b|h|w|d} rd, symbol, rt   auipc rt, symbol[31:12]                     存储全局量
                            s{b|h|w|d} rd, symbol[11:0](rt)

fl{w|d} rd, symbol, rt      auipc rt, symbol[31:12]                     读取浮点全局量
                            fl{w|d} rd, symbol[11:0](rt)

fs{w|d} rd, symbol, rt      auipc rt, symbol[31:12]                     存储浮点全局量
                            fs{w|d} rd, symbol[11:0](rt)

li rd, immediate            Myriad sequences                            读取立即数
mv rd, rs                   addi rd, rs, 0                              复制寄存器
not rd, rs                  xori rd, rs, -1                             反码
sext.w rd, rs               addiw rd, rs, 0                             有符号扩展字
seqz rd, rs                 sltiu rd, rs, 1                             为0时置位

fmv.s rd, rs                fsgnj.s rd, rs, rs                          复制单精度寄存器
fabs.s rd, rs               fsgnjx.s rd, rs, rs                         单精度绝对值
fneg.s rd, rs               fsgnjn.s rd, rs, rs                         单精度相反数
fmv.d rd, rs                fsgnj.d rd, rs, rs                          复制双精度寄存器
fabs.d rd, rs               fsgnjx.d rd, rs, rs                         双精度绝对值
fneg.d rd, rs               fsgnjn.d rd, rs, rs                         双精度相反数

bgt rs, rt, offset          blt rt, rs, offset                          大于时转移
ble rs, rt, offset          bge rt, rs, offset                          小于等于时转移
bgtu rs, rt, offset         bltu rt, rs, offset                         无符号大于时转移
bleu rs,rt, offset          bgeu rt, rs, offset                         无符号小于等于时转移

jal offset                  jal x1, offset                              跳转并链接
jalr rs                     jalr x1, rs, 0                              跳转并链接寄存器

call offset                 auipc x1, offset[31:12]                     远程调用子过程
                            jalr x1, x1, offset[11:0]

fence                       fence iorw, iorw                            内存和I/O屏障

fscsr rd, rs                csrrw rd, fcsr, rs                          交换 FP 控制/状态寄存器
fsrm  rd, rs                csrrw rd, frm, rs                           交换 FP 舍入模式
fsflags rd, rs              csrrw rd, fflags, rs                        交换 FP 例外标志


