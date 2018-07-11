# GAS汇编器伪指令大全

1、间隔符。可用空格或Tab，一个多个均可，无顺序。

2、注释。段注释和C语言的相同，都是/*...*/。而行注释就因TARGET不同而不同了。X86机上，使用“＃”。ARM行注释采用“；”或者“@”。

3、符号。符号由字母、数字、(_ . $)这三种组合而成的一个或者多个字符组成。注意不要以数字开头，没有长度限制，大小写敏感。符号以不在字符集内的字符分割，或者是以文件开头分割。

4、语句。支持空行，其他和X86下的汇编类似，以newline（“\n”）结束。

5、常量。包含字符常量、字符串、数字常量等。关于数字常量，以“0X”或“0x”开头表示16进制，以“0B”或“0b”开头表示二进制，以“0”开头表示八进制，以非零开头表示十进制。十进制和八进制容易出错了。还是直接使用16进制好。如果使用十进制，注意开头不能为0。

.abort

该指令的作用是立即停止汇编。这么做是为了与其他汇编器兼容。最初的想法是汇编语言源程序将被传送到汇编器。如果源程序的发送者退出，它可以使用此指令告诉as也退出。有一天.abort将不受支持。

.ABORT（COFF）

当生成COFF输出时，as接受此指令作为.abort的同义词。

.align abs-expr, abs-expr, abs-expr

将位置计数器（在当前子段中）填充到特定存储边界。
第一个表达式（必须是绝对的）是所需的对齐，如下所述。
第二个表达式（也是绝对的）给出填充值存储在填充字节中。它（和逗号）可以省略。如果省略，则填充字节通常为零。但是，在大多数系统上，如果该部分被标记为包含代码并且省略了填充值，则该空间将填充无操作指令。
第三个表达式也是绝对的，也是可选的。如果存在，则是此对齐指令应跳过的最大字节数。如果进行对齐将需要跳过比指定的最大值更多的字节，则根本不会进行对齐。您可以完全省略填充值（第二个参数），只需在所需的对齐后使用两个逗号；如果您希望在适当的时候使用无操作指令填充对齐，这可能很有用。
指定所需对齐的方式因系统而异。对于arc，hppa，使用ELF的i386，iq2000，m68k，or1k，s390，sparc，tic4x，tic80和xtensa，第一个表达式是以字节为单位的对齐请求。例如 '.align 8'使位置计数器前进，直到它是8的倍数。如果位置计数器已经是8的倍数，则不需要进行任何更改。对于tic54x，第一个表达式是word中的对齐请求。
对于其他系统，包括ppc，使用a.out格式的i386，arm和strongarm，它是位置计数器在前进后必须具有的低位零位数。例如 '.align 3'使位置计数器前进，直到它为8的倍数。如果位置计数器已经是8的倍数，则不需要进行任何更改。
这种不一致是由于各种本地汇编程序对GAS必须模拟的这些系统的不同行为。GAS也提供了.balign和.p2align指令，后面描述，其中有在所有体系结构一致的行为（但具体到GAS）。

.ascii "string"

.ascii期望用逗号分隔的零个或多个字符串文字（请参阅字符串）。它将每个字符串（没有自动尾随零字节）组合成连续的地址。

.asciz "string"

`.asciz` 就像 `.ascii`，但每个字符串后跟一个零字节。其中的'z'代表“零”。

.balign[wl] abs-expr, abs-expr, abs-expr

将位置计数器（在当前子部分中）填充到特定存储边界。
第一个表达式（必须是绝对的）是以字节为单位的对齐请求。例如 '.balign 8'使位置计数器前进，直到它是8的倍数。如果位置计数器已经是8的倍数，则不需要进行任何更改。
第二个表达式（也是绝对的）给出填充值存储在填充字节中。它（和逗号）可以省略。如果省略，则填充字节通常为零。但是，在大多数系统上，如果该部分被标记为包含代码并且省略了填充值，则该空间将填充无操作指令。
第三个表达式也是绝对的，也是可选的。如果存在，则是此对齐指令应跳过的最大字节数。如果进行对齐将需要跳过比指定的最大值更多的字节，则根本不进行对齐。您可以完全省略填充值（第二个参数），只需在所需的对齐后使用两个逗号; 如果您希望在适当的时候使用无操作指令填充对齐，这可能很有用。
在 `.balignw` 和 `.balignl` 指令是变体的 `.balign` 指令。该 `.balignw` 指令将填充模式视为双字节字值。该.balignl指令把填充图案为四个字节长字值。例如，.balignw 4, 0x368d将对齐到4的倍数。如果它跳过两个字节，它们将填入值0x368d（字节的确切位置取决于处理器的字节顺序）。如果它跳过1或3个字节，则填充值未定义。

.bundle_align_mode abs-expr

.bundle_align_mode启用或禁用对齐的指令包模式。

.bundle_lock和.bundle_unlock
在.bundle_lock和指令.bundle_unlock指令允许在指令束填充明确的控制。这些指令仅.bundle_align_mode在用于启用对齐指令包模式时有效。如果它们在.bundle_align_mode完全没有被使用时出现，或者在最后一个指令是.bundle_align_mode 0时出现，则会出错。

.byte expressions

.byte期望零或多个表达式，以逗号分隔。每个表达式都汇编到下一个字节中。

## CFI 指令

.cfi_sections section_list

.cfi_sections可用于指定CFI指令是否应发出.eh_frame部分和/或.debug_frame部分。如果section_list是.eh_frame，.eh_frame被发射，如果section_list是.debug_frame，.debug_frame被发射。要发射两者，同时使用.eh_frame，.debug_frame。如果不使用此指令，则默认为.cfi_sections .eh_frame。
在支持紧凑展开表的目标上，可以通过指定.eh_frame_entry而不是生成这些表来生成.eh_frame。
某些目标可能支持其他名称，例如.c6xabi.exidx目标使用的名称。
如果CFI生成尚未启动，则可以使用相同或不同的参数重复.cfi_sections指令。但是，一旦CFI生成开始，分区列表是固定的，任何重新定义它的尝试都会导致错误。

.cfi_startproc [simple]
.cfi_startproc在每个函数的开头使用，在.eh_frame中应该有一个条目。它初始化一些内部数据结构。别忘了关闭这个功能.cfi_endproc。
除非.cfi_startproc与参数simple一起使用, 它还会发出一些与体系结构相关的初始CFI指令。

.cfi_endproc
.cfi_endproc在函数的末尾使用,它关闭以前由.cfi_startproc打开的展开项,并将其发送到.eh_frame。

.cfi_personality encoding [, exp]
. cfi_personality 定义了个性规律及其编码。编码必须是一个常量，以确定如何编码个性。如果是255（DW_EH_PE_omit），则不存在第二个参数，否则第二个参数应为常量或符号名称。在使用间接编码时，所提供的符号应该是可以从其加载个性的位置，而不是个性常规本身。默认值为.cfi_startproc是cfi_personality 0xff, 没有个性习惯。

.cfi_personality_id id
cfi_personality_id定义了一个个性例程，其索引定义为紧凑的展开格式。仅在生成紧凑EH帧时有效（即.cfi_sections eh_frame_entry）。

.cfi_fde_data [opcode1 [, …]]
cfi_fde_data用于描述用于当前函数的紧凑展开操作码。如果足够小且没有LSDA，或者在.gnu.extab节中，则会在.eh_frame_entry节中内联发出这些内容。仅在生成紧凑EH帧时有效（即.cfi_sections eh_frame_entry）。

.cfi_lsda encoding [, exp]
.cfi_lsda定义LSDA及其编码。编码必须是确定如何编码LSDA的常量。如果是255（DW_EH_PE_omit），则不存在第二个参数，否则第二个参数应为常量或符号名称。默认值为.cfi_startproc紧跟cfi_lsda 0xff，即不存在LSDA。

.cfi_inline_lsda [align]
.cfi_inline_lsda标记LSDA数据节的开始，并切换到相应的.gnu.extab节。前面必须有一个包含.cfi_lsda指令的CFI块。仅在生成紧凑EH帧时有效（即.cfi_sections eh_frame_entry）。
此时将生成表头和展开操作码，以便紧接着LSDA数据。.cfi_lsda指令引用的符号仍应在使用基于回退FDE的编码时定义。LSDA数据由节指令终止。
可选对齐参数指定所需的对齐方式。对齐方式指定为2的幂，与.p2align指令相同。

.cfi_def_cfa register, offset
.cfi_def_cfa定义了一个计算CFA的规则：从寄存器中取地址并添加偏移量。

.cfi_def_cfa_register register
.cfi_def_cfa_register修改计算CFA的规则。从现在起注册将使用而不是旧的。偏移量保持不变。

.cfi_def_cfa_offset offset
.cfi_def_cfa_offset修改计算CFA的规则。寄存器保持不变，但偏移量是新的。注意，它是将被添加到定义的寄存器中以计算CFA地址的绝对偏移量。

.cfi_adjust_cfa_offset offset
与.cfi_def_cfa_offset相同, 但偏移量是从上一个偏移量中加/减的相对值。

.cfi_offset register, offset
寄存器的先前值保存在从CFA的偏移量偏移处。

.cfi_val_offset register, offset
寄存器的先前值是CFA+偏移量。

.cfi_rel_offset register, offset
寄存器的先前值保存在偏离当前CFA寄存器的偏移量处。这被转换为.cfi_offset使用来自CFA的CFA寄存器的已知位移。这通常更容易使用，因为该数字将与它注释的代码相匹配。

.cfi_register register1, register2
寄存器1的先前值保存在寄存器寄存器2中。

.cfi_restore register
.cfi_restore在执行所有由.cfi_startproc添加的初始指令之后，寄存器的规则现在与函数开头的规则相同。

.cfi_undefined register
从现在开始，寄存器的先前值无法再恢复。

.cfi_same_value register
寄存器的当前值与前一帧中的相同，即不需要恢复。

.cfi_remember_state和.cfi_restore_state
.cfi_remember_state将每个寄存器的规则集推送到隐式堆栈，同时将.cfi_restore_state它们从堆栈中弹出并将它们放在当前行中。这对于.cfi_*由于程序的控制流而需要撤消多个指令的情况很有用。例如，我们可以有类似的东西（假设CFA是rbp的值）：
```
je label
popq ％rbx
.cfi_restore ％rbx
popq ％r12
.cfi_restore ％r12
popq ％rbp
.cfi_restore ％rbp
.cfi_def_cfa ％rsp，8
ret
label：
/* Do something else */
```
在这里，我们希望.cfi指令只影响与标签之前的指令对应的行。这意味着，我们必须在标签之后添加多个.cfi指令，以重新创建寄存器的原始保存位置，并将CFA重新设置为"限制性"的值。这将是笨拙的, 并导致更大的二进制大小。相反, 我们可以这样写：
```
je label
popq ％rbx
.cfi_remember_state
.cfi_restore ％rbx
popq ％r12
.cfi_restore ％r12
popq ％rbp
.cfi_restore ％rbp
.cfi_def_cfa ％rsp，8
ret
label：
.cfi_restore_state
/* Do something else */
```
这样，后面的指令规则label将与第一个之前的规则相同，.cfi_restore而不必使用多个.cfi指令。

.cfi_return_column register
更改返回列寄存器，即返回地址直接在寄存器中，或者可以通过寄存器规则访问。

.cfi_signal_frame
将当前功能标记为信号蹦床。

.cfi_window_save
SPARC注册窗口已保存。

.cfi_escape expression [，...]
允许用户向展开信息添加任意字节。可以使用它来添加特定于操作系统的CFI操作码，或者GAS尚不支持的通用CFI操作码。

.cfi_val_encoded_addr register, encoding, label
寄存器的当前值是label。label的值将根据编码在输出文件中编码；有关此编码的详细信息，参见.cfi_personality说明。
将寄存器等同于固定标签的用处可能仅限于返回地址寄存器。在这里，标记一个只有一个返回地址的代码段是有用的，该代码段由直接分支到达，并且内存或另一个寄存器中不存在返回地址的副本。

.comm symbol, length

.comm声明一个名为symbol的通用符号。链接时，一个目标文件中的公共符号可以与另一个目标文件中的相同名称的已定义或公共符号合并。

.data subsection
.data告诉as将以下语句汇编到数据小节编号子节的末尾（这是一个绝对表达式）。如果省略subsection，则默认为零。

.dc[size] expressions
.dc指令期望用逗号分隔零个或多个表达式。评估这些表达式并将其值插入当前节。发出值的大小取决于.dc指令的后缀 ：
'.a'
发出N位值，其中N是目标系统上地址的大小。
'.b'
发出8位值。
'.d'
发出双精度浮点值。
'.l'
发出32位值。
'.s'
发出单精度浮点值。
'.w'
发出16位值。注意 - 即使在.word指令将发出32位值的目标上也是如此。
'.x'
发出长双精度浮点值。
如果没有使用后缀，则假设是'.w' 。
字节排序与目标有关，浮点值的大小和格式也是如此。

.dcb[size] number [,fill]
该指令发出fill的number个副本，每个size字节。number和fill都是绝对表达式。如果省略逗号和填充，则假定填充为零。如果省略了逗号和fill，则假定fill为零。size后缀（如果存在） 必须是下列值之一：
'.b'
发出单字节值。
'.d'
发出双精度浮点值。
'.l'
发出4字节值。
'.s'
发出单精度浮点值。
'.w'
发出2字节值。
'.x'
发出长双精度浮点值。
如果省略大小后缀，则假设是'.w'。
字节排序与目标有关，浮点值的大小和格式也是如此。

.def name
开始定义符号名称的调试信息; 直到遇到.endef指令。

.desc symbol, abs-expression
该指令将符号的描述符（请参阅符号属性）设置为绝对表达式的低16位。
当as被配置为COFF输出时，'.desc'指令不可用; 它仅用于a.out或b.out 对象格式。为了兼容性，as接受它，但在配置为COFF时不产生输出。

.dim
该指令由编译器生成，以在符号表中包含辅助调试信息。它只被允许在.def/.endef内出现。

.double flonums
.double期望零或更多的flonums，用逗号分隔（其实就是定义一个64位IEEE双精度浮点数）。它汇编了浮点数。发出的确切浮点数取决于as的配置方式。请参阅机器依赖性。

.eject
当生成汇编列表时，在此位置强制插入一个分页符。

.else
.else是as支持条件汇编的一部分；参见.if。如果前面的条件.if为假，它标志着要汇编的代码段的开始。

.end
表示汇编程序的结束。

.endef
此指令标记以.def开始的符号定义的结束。

.endfunc
.endfunc标记以.func指定的函数的结束。

.endif
.endif是as条件汇编支持的一部分; 它标志着条件汇编的代码块的结束。参见.if。

.equ symbol, expression
该指令将symbol的值设置为expression。它是'.set'的代名词；参见.set。
在HPPA上equ的语法是'symbol .equ expression'。
在Z80上equ的语法是'symbol equ expression'。如果符号已经被定义，则在Z80上这是一个错误，但该符号不受以后重新定义的保护。比较一下equiv。

.equiv symbol, expression
.equiv指令是像.equ和.set，不同之处在于，但如果符号已经定义，汇编器将发出错误信号。注意已引用但未实际定义的符号被视为未定义。
除了错误消息的内容外，这大致等同于：
.ifdef SYM
.err
.endif
.equ SYM,VAL
加上它可以保护符号以后不被重新定义。

.eqv symbol, expression
.eqv指令类似于.equiv，但没有尝试对表达式或它的任何部分立即进行评估。相反，每次在表达式中使用生成的符号时,将采取其当前值的快照。

.err
如果as汇编.err指令，它将打印错误消息,除非使用-z 选项,否则不会生成对象文件。这可用于在有条件编译的代码中发出错误信号。

.error "string"
类似于.err，此指令发出错误,但您可以指定将作为错误消息发出的字符串。如果未指定消息,则默认为".error directive invoked in source file"。参见错误和警告消息。
.error "This code has not been assembled and tested."。

.exitm
从当前的宏定义中提前退出。参见宏。

.extern
.extern在源程序中被接受，为了兼容其它汇编器起见，但它被忽略了。as将所有未定义符号视为外部。

.fail expression
生成错误或警告。如果表达式的值为500或更多，将打印警告消息。如果值小于 500，将打印错误消息。该消息将包括表达式的值。这在复杂的嵌套宏或条件汇编内偶尔会有用。

.file
.file指令有两个不同的版本。支持DWARF2行号信息的目标使用DWARF2版本的.file。其他目标使用默认版本。
默认版本
此版本的.file指令告诉我们即将启动一个新的逻辑文件。语法是:
.file string
字符串是新文件名。通常，文件名被识别是否被引号""所包围；但是，如果您希望指定一个空文件名，则必须给出引号""。此语句将来可能会消失：它只被识别为与旧程序兼容。
DWARF2版本
在发出DWARF2行号信息时，.file将文件名分配给.debug_line文件名表。语法是：
.file fileno filename
fileno操作数应该是唯一正整数，用作表中条目的索引。文件名操作数是C字符串文本。
由于文件名表与DWARF2调试信息的.debug_info部分共享，因此用户必须知道表条目将具有的确切索引，所以文件名索引的详细信息会暴露给用户。

.fill repeat, size, value
repeat，size和value都是绝对表达式。这将发出重复的大小字节副本。重复可能为零或更多。大小可能为零或更多，但如果它大于8，则它被认为具有值8，与其他人的汇编器兼容。每个重复字节的内容取自8字节的数字。最高阶4字节为零。最低顺序4字节是在计算机上作为正在汇编的整数的字节顺序呈现的值。重复中的每个大小字节都取自此数字的最低顺序大小字节。同样，这种怪异的行为与其他人的汇编器是兼容的。
size和value是可选的。如果没有第二个逗号和值，则假定value为零。如果缺少第一个逗号和以下标记，则假定size为1。

.float flonums
此指令汇编零个或多个浮点数，用逗号隔开。它的效果与.single相同。发出的浮点数字的确切类型取决于as配置的方式。参见计算机依赖性。

.func name[, label]
.func发出调试信息以表示函数名，除非在启用调试的情况下汇编文件，否则将被忽略。当前仅有"--gstabs[+]"支持。标签是函数的入口点，如果使用"leading char"前面的省略名称。"leading char"通常是 _ 或无，具体取决于目标。所有函数当前都定义为具有void返回类型。该函数必须以.endfunc终止。

.global symbol, .globl symbol
全局使符号对ld可见。如果在分部程序中定义符号，则它的值可用于与之链接的其他部分程序。否则，符号将其属性从链接到同一程序的另一个文件的同名符号中获取。
这两种拼写 (".globl"和".global") 都被接受，以便与其他汇编器兼容。
在HPPA上，.global并不总是足以让其他部分程序访问它。你可能需要HPPA特有的.EXPORT指令。参见HPPA汇编器指令。

.gnu_attribute tag,value
记录此文件的GNU对象属性。参见对象属性。

.hidden names
这是ELF可见性指令之一。另外两个是.internal（参见.internal）和.protected（参见.protected）。
此指令重写命名符号默认可见性（由其绑定设置：local、global或weak）。该指令将可见性设置为隐藏，这意味着符号对其他组件是不可见的。这些符号总是被认为是受保护的。

.hword expressions
这将要求零个或多个表达式，并为每个表示发出16位数。
此指令是".short"的同义词。取决于目标体系结构，它也可能是".word"的同义词。

.ident
某些汇编器使用此指令将标记放置在对象文件中。此指令的行为因目标而异。使用a.out对象文件格式时，只需接受与现有汇编器的源文件兼容性的指令，但不为其发出任何内容。使用COFF时, 将根据目标向.comment或.rdata节发出注释。使用ELF时，注释会发出到.comment部分。

.ifdef symbol
如果已定义指定的符号，则汇编下面的代码。
.ifb text
如果操作数为空（blank或empty），则汇编下面的代码。
.ifc string1,string2
如果两个字符串相等，则汇编下面的代码。
.ifeq absolute expression
如果参数为零，则汇编下面的代码。
.ifeqs string1,string2
另一种形式的.ifc，必须使用双引号引用字符串。
.ifge absolute expression
如果参数大于或等于零，则汇编下面的代码。
.ifgt absolute expression
如果参数大于零，则汇编下面的代码。
.ifle absolute expression
如果参数小于或等于零，则汇编下面的代码。
.iflt absolute expression
如果参数小于零，则汇编下面的代码。
.ifnb text
就像.ifb，但是作用相反。如果操作数是非空（non-blank或non-empty），则汇编下面的代码。
.ifnc string1,string2
就像.ifc，但是作用相反。如果两个字符串不相等，则汇编下面的代码。
.ifndef symbol, .ifnotdef symbol
如果尚未定义指定的符号，则汇编下面的代码。两种写法是等价的。注意，已引用但尚未定义的符号被视为未定义。
.ifne absolute expression
如果参数不等于零，则汇编下面的代码。
.ifnes string1,string2
就像.ifeqs，但是作用相反。如果两个字符串不相等，则汇编下面的代码。

.incbin "file"[, skip[, count]]
incbin指令在当前位置上逐字地包含文件。您可以控制与"-I"命令行选项一起使用的搜索路径 (参见命令行选项)。文件周围需要引号。
skip参数从文件开头跳过字节数。count参数指示要读取的最大字节数。注意，数据没有以任何方式对齐，因此用户有责任确保在incbin指令前后提供正确的对齐方式。

.include "file"
此指令提供了一种在源程序的指定点包含支持文件的方法。文件中的代码是按照.include的点进行汇编的；当到达包含文件的末尾时，原始文件的汇编将继续进行。您可以控制与"-I"命令行选项一起使用的搜索路径 (参见命令行选项)。文件名必须用引号包括。

.int expressions
期望零个或更多的表达式，任何部分，用逗号隔开。对于每个表达式，发出一个在运行时为该表达式的值的数字。数字的字节顺序和位大小取决于汇编的目标类型。

.internal names
这是ELF可见性指令之一。另外两个是.hidden（参见.hidden）和.protected（参见.protected）。
此指令重写命名符号默认可见性（由其绑定设置：local、global或weak）。该指令将可见性设置为隐藏，这意味着符号对其他组件是不可见的。这些符号总是被认为是受保护的。

.irp symbol, values…
计算为符号分配不同值的语句序列。语句序列从.irp指令开始，并由.endr指令终止。对于每个值，符号都设置为值，并且语句序列被汇编。如果未列出任何值，则会汇编语句序列一次，并将符号设置为null字符串。要在语句序列中引用符号，请使用\symbol。
举例说明，汇编：
```
.irp param,1,2,3
move d\param,sp@-
.endr
```
等效于汇编：
```
move d1,sp@-
move d2,sp@-
move d3,sp@-
```
有关符号拼写的一些警告，参见宏。

.irpc symbol, values…
计算为符号分配不同值的语句序列。语句序列从.irpc指令开始，并由.endr指令终止。对于值中的每个字符，符号都设置为字符，并且语句序列被汇编。如果未列出任何值，则会汇编语句序列一次，并将符号设置为null字符串。要在语句序列中引用符号, 请使用\symbol。
举例说明，汇编：
```
.irpc param,123
move d\param,sp@-
.endr
```
等效于汇编：
```
move d1,sp@-
move d2,sp@-
move d3,sp@-
```
对于一些告诫与符号的拼写，参见关于宏的讨论。

.lcomm symbol, length
由符号表示的本地公用的预留长度（绝对表达式）字节。符号的节和值是新的局部通用的。这些地址在bss节中分配, 以便在运行时字节从零开始。符号未声明为全局（参见.global），因此通常对ld不可见。
某些目标允许第三个参数与.lcomm一起使用。此参数指定在bss节中符号的所需对齐方式。
.lcomm的语法在HPPA上稍有不同。语法是'symbol .lcomm, length'；符号是可选的。

.lflags
as接受此指令，以便与其他汇编器兼容，但忽略它。

.line line-number
更改逻辑行号。行号必须是绝对表达式。下一行具有该逻辑行号。因此, 当前行上的任何其他语句（在语句分隔符字符之后）都将报告为逻辑行号：行号-1。某一天as可能不再支持此指令：它仅能与现有的汇编器兼容。
尽管这是一个与a.out或b.out对象-代码格式无关的指令，但as在制作COFF输出时仍能识别它，且将COFF的'ln'视为'.line'，即使它在.def/.endef之外。
而在.def中，".line"是编译器用来生成用于调试的辅助符号信息的指令之一。

linkonce [type]
标记当前节，以便链接器仅包含它的单个副本。这可能用于在多个不同的对象文件中包含同一节，但要确保链接器只在最终输出文件中包含一次。linkonce伪运算必须用于该节的每个实例。根据节名检测到重复节，因此它应该是唯一的。
此指令仅受少数对象文件格式的支持。在这篇文章中，唯一支持它的对象文件格式是Windows NT上使用的可移植可执行格式。
类型参数是可选的。如果指定，它必须是下列字符串之一。例如:
.linkonce same_size
并非所有对象文件格式都可以支持所有类型。
discard
默默丢弃重复的部分。这是默认值。
one_only
警告如果有重复的节, 但仍然只保留一个副本。
same_size
如果任何重复项有不同的大小, 则发出警告。
same_contents
如果任何重复项没有完全相同的内容, 则发出警告。

.list
控制（与.nolist指令一起使用）是否生成汇编清单。这两个指令维护一个内部计数器（最初为零）。.list递增计数器，然后.nolist递减。每当计数器大于零时，都会生成汇编列表。
默认情况下，列表被禁用。当您启用它们时（使用"-a"命令行选项；请参见命令行选项），列表计数器的初始值为一。

.ln line-number
'.ln'是'.line'的同义词。

.loc fileno lineno [column] [options]
当发出DWARF2行号信息时，.loc指令将向.debug_line行号矩阵中添加一行，对应于紧跟在汇编指令后面的。在添加行之前，fileno、lineno和可选列参数将应用于.debug_line状态机。
这些选项是按任意顺序排列的以下标记：
basic_block
此选项会将.debug_line状态机中的basic_block寄存器设置为true。
prologue_end
此选项会将.debug_line状态机中的prologue_end寄存器设置为true。
epilogue_begin
此选项会将.debug_line状态机中的epilogue_begin寄存器设置为true。
is_stmt value
此选项会将.debug_line状态机中的is_stmt寄存器设置为值，必须为0或1。
isa value
此指令会将.debug_line状态机中的isa寄存器设置为值，它必须是无符号整数。
discriminator value
此指令会将.debug_line状态机中的鉴别器寄存器设置为值，它必须是无符号整数。
view value
此选项导致将行添加到.debug_line中，以引用当前地址（可能与下面的汇编指令不相同），并将值与.debug_line状态机中的视图寄存器关联。如果值是标签，则视图寄存器和标签都设置为在同一程序位置上的前.loc指令的数量。如果值为字面0，则视图寄存器设置为零，而汇编程序断言在同一应用程序位置没有任何以前的.loc指令。如果值为字面-0，则汇编程序会安排在此行中重置视图寄存器，即使在同一程式位置有前.loc指令。

.loc_mark_labels enable
在发出DWARF2行号信息时，.loc_mark_labels指令使汇编程序在出现代码标签时使用状态机集中的basic_block寄存器向.debug_line行号矩阵发出一个条目。启用参数应为1或0，以便分别启用或禁用此函数。

.local names
此指令可用于ELF目标，将以逗号分隔的名称列表中的每个符号标记为本地符号，以使其不会在外部可见。如果符号不存在，将创建它们。
对于lcomm指令（参见lcomm）不接受对齐参数的目标，对于大多数ELF目标来说，.local指令可以与.comm（参见comm）结合使用来定义对齐的本地通用数据。

.long expressions
.long等同于'.int'。参见.int。

.macro
.macro MACRO_NAME PARAM1, PARAM2
    .exitm
.endm

.mri val
如果val是非零，这就告诉进入MRI模式。如果val为零，则说明退出MRI模式。此更改将影响汇编到下一.mri指令的代码，或直到文件的末尾。参见MRI模式。

.noaltmacro
禁用备用宏模式。见altmacro。

.nolist
控制（与.nolist指令一起使用）是否生成汇编清单。这两个指令维护一个内部计数器（最初为零）。.list递增计数器，然后.nolist递减。每当计数器大于零时，都会生成汇编列表。

.nops size[, control]
此指令发出填充无操作指令的size字节。size是绝对表达式，它必须是正值。control控制如何生成无操作指令。如果省略逗号和control，则假定控件为零。
注意：对于Intel 80386和AMD x86-64目标，control指定无操作指令的大小限制。控制的有效值在16位模式下介于0和4之间，在32位模式下调整为较旧的处理器时为0到7之间，在64位模式下调整为0到11之间，或者在32位调整为较新的处理器时模式。使用0时，无操作指令大小限制设置为支持的最大大小。

.octa bignums
该指令需要零个或多个bignums，以逗号分隔。对于每个bignum，它发出一个16字节的整数。
术语"octa"来自上下文，其中"word"是两个字节; 因此octa-word为16个字节。

.offset loc
将位置计数器设置为绝对部分中的loc。loc必须是绝对表达式。该指令可用于定义具有绝对值的符号。不要将它与.org指令混淆。

.org new-lc , fill
将当前节的位置计数器前进到new-lc。new-lc是绝对表达式或与当前子节具有相同部分的表达式。也就是说，你不能使用.org横截面：如果new-lc有错误的节，.org则忽略该指令。为了与以前的汇编器兼容，如果new-lc的节是绝对的，as发出警告，然后假装new-lc的部分与当前子节相同。
.org可能只会增加位置计数器，或保持不变; 你不能用来.org向后移动位置计数器。
因为as尝试在一次传递中汇编程序，所以new-lc可能不是未定义的。如果你真的讨厌这个限制，我们热切期待有机会分享你改进的汇编器。
请注意，原点是相对于该节的开头，而不是该节的开头。这与其他人的汇编器兼容。
当（当前子节的）位置计数器被提前时，插入的字节用填充填充，填充应该是绝对表达式。如果省略逗号和填充，则填充默认值为零。

.p2align[wl] abs-expr, abs-expr, abs-expr
将位置计数器（在当前子节中）填充到特定存储边界。第一个表达式（必须是绝对的）是位置计数器在前进后必须具有的低位零位数。例如'.p2align 3'使位置计数器前进，直到它为8的倍数。如果位置计数器已经是8的倍数，则不需要进行任何更改。
第二个表达式（也是绝对的）给出填充值存储在填充字节中。它（和逗号）可以省略。如果省略，则填充字节通常为零。但是，在大多数系统上，如果该部分被标记为包含代码并且省略了填充值，则该空间将填充无操作指令。
第三个表达式也是绝对的，也是可选的。如果存在，则是此对齐指令应跳过的最大字节数。如果进行对齐将需要跳过比指定的最大值更多的字节，则根本不进行对齐。您可以完全省略填充值（第二个参数），只需在所需的对齐后使用两个逗号; 如果您希望在适当的时候使用无操作指令填充对齐，这可能很有用。
在.p2alignw和.p2alignl指令是变体的 .p2align指令。该.p2alignw指令将填充模式视为双字节字值。该.p2alignl指令把填充图案为四个字节长字值。例如，.p2alignw 2,0x368d将对齐到4的倍数。如果它跳过两个字节，它们将填入值0x368d（字节的确切位置取决于处理器的字节顺序）。如果它跳过1或3个字节，则填充值未定义。

.popsection
这是ELF节堆栈操作指令之一。其他的是 .section（参见section），.subsection（参见subsection），.pushsection（参见pushsection）和.previous（参见previous）。
该指令用截面堆栈上的顶部（和子节）替换当前部分（和子节）。此节从堆栈中弹出。

.print string
as将在汇编期间在标准输出上打印字符串。您必须将字符串放在双引号中。

.protected names
这是ELF可见性指令之一。另外两个是.hidden（见hidden）和.internal（见internal）。
该指令覆盖命名符号的默认可见性（由其绑定设置：local，global或weak）。该指令设置可见性为protected，这意味着必须将定义它们的组件中对符号的任何引用解析为该组件中的定义，即使另一个组件中的定义通常会抢占它。

.psize lines, columns
在生成列表时，使用此伪指令声明每个页面使用的行数和（可选）列数。
如果您不使用.psize，列表使用默认行数60。您可以省略逗号和列规范；默认宽度为200列。
as每当超过指定的行数时（或者在您明确请求一行时使用.eject），都会生成换页。
如果将行指定为0，则不会生成formfeeds，从而保存显式指定的.eject。

.purgem name
取消定义宏名称，以便以后使用该字符串不会被扩展。参见宏。

.pushsection name [, subsection] [, "flags"[, @type[,arguments]]]
这是ELF部分堆栈操作指令之一。其他的是.section（参见section），.subsection（参见subsection），.popsection（参见popsection）和.previous （参见previous）。
此指令将当前section（和subsection）推送到节堆栈的顶部，然后用name和subsection替换当前节和小节。可选flags、type和arguments的处理方式与.section（参见节）指令中的相同。

.quad bignums
.quad期望零或更多的bignums，用逗号分隔。对于每个bignum，它发出一个8字节的整数。如果bignum不适合8个字节，它会输出一条警告信息; 并且只取最低8字节的bignum。
术语"quad"来自上下文，其中"word"是两个字节；因此quad-word为8个字节。

.reloc offset, reloc_name[, expression]
使用值表达式在reloc_name类型的偏移量处生成重定位。如果offset是数字，则在当前节中生成重定位。如果offset是一个解析为符号加偏移量的表达式，则会在给定符号的节中生成重定位。表达式（如果存在）必须解析为符号加上加数或绝对值，但请注意，并非所有目标都支持加数。例如，诸如i386之类的ELF REL目标在节内容中存储加数而不是在重定位中。此低级别接口不支持存储在该节中的加数。

.rept count
重复.rept指令和下一个.endr指令计数次数之间的行序列。
举例说明，汇编：
```
.rept 3
.long 0
.endr
```
相当于汇编：
```
.long 0
.long 0
.long 0
```
允许计数为零，但不生成任何内容。不允许使用负数，如果遇到则将其视为零。

.sbttl "subheading"
生成汇编列表时，使用subheading作为标题（第三行，紧接标题行之后）。
此指令会影响后续页，如果它出现在页顶部的十行内，则会影响当前页。

.scl class
设置符号的存储类值。该指令只能在.def/.endef中使用。存储类可以标记符号是静态的还是外部的，或者它可以记录进一步的符号调试信息。

.section name
使用该.section指令将下面的代码汇编到名为name的节中。
该指令仅支持实际支持任意命名节的目标；例如，在a.out目标上，即使使用标准的a.out节名，也不接受它。

.set symbol, expression
将symbol的值设置为expression。这会更改符号的值和类型以符合表达式。如果symbol被标记为外部，则它仍然被标记（参见符号属性）。
如果.set给予符号的值是常量，则可以在同一程序集中多次使用符号。允许使用基于涉及其他符号的表达式的值，但某些目标可能会将此限制为仅在每个程序集中执行一次。这是因为这些目标在汇编时不设置符号的地址，而是延迟赋值，直到执行最终链接。这允许链接器有机会改变文件中的代码，改变各种不同符号的位置和相对距离。
如果.set是全局符号，则存储在目标文件中的值是存储在其中的最后一个值。
在Z80上set是一个真正的指令，使用'symbol defl expression'替代。

.short expressions
.short通常与"word"相同。参见.word。
在一些配置中，.short和.word产生不同长度的数字。参见机器依赖性。

.single flonums
该指令汇编零个或多个flonums，以逗号分隔。它和.float具有相同的效果。发出的确切浮点数取决于as的配置方式。参见机器依赖性。

.size
该指令用于设置与符号关联的大小。
COFF版本
对于COFF目标，该.size指令仅允许出现在.def/.endef中。使用方法如下：
.size expression
ELF版本
对于ELF目标，.size指令使用方法如下：
.size name, expression
该指令设置与符号名称关联的大小。以字节为单位的大小是根据表达式计算的，该表达式可以使用标签算法。该指令通常用于设置函数符号的大小。

.skip size [,fill]
该指令发出size个字节，每个值都fill。size和fill都是绝对表达式。如果省略逗号和fill，则假定填充为零。这和'space'相同。

.sleb128 expressions
sleb128代表"signed little endian base 128"。这是DWARF符号调试格式使用的可变长度表示的数字缩写。参见.uleb128。

.space size [,fill]
该指令发出size字节，每个值都fill。size和fill是绝对表达式。如果省略逗号和填充，则假定填充为零。这与'skip'相同。
警告：.space对于HPPA目标具有完全不同的含义；请使用.block作为替代。有关该指令的含义，请参阅"HP9000系列800汇编语言参考手册（HP 92432-90001）"中.space的含义。有关摘要，参见HPPA汇编器指令。

.stabd, .stabn, .stabs
有三个指令开始'.stab”。所有发出符号（参见符号），供符号调试器使用。这些符号不会输入到as哈希表中：它们不能在源文件的其他位置引用。最多需要五个字段：
string
这是符号的名称。它可能包含任何字符，除了'\000'，比普通的符号名称更通用。一些调试器用于使用该字段将任意复杂的结构编码为符号名称。
type
一个绝对表达式。符号的类型设置为此表达式的低8位。允许任何位模式，但ld调试器会愚蠢的位模式。
other
一个绝对表达式。符号的"other"属性设置为此表达式的低8位。
desc
一个绝对表达式。符号的描述符设置为此表达式的低16位。
value
绝对表达式，它成为符号的值。
如果读取被检测到警告.stabd，.stabn或.stabs声明，该符号有可能已经被创建；你在目标文件中得到一个半成形的符号。这与早期的汇编器兼容！
.stabd type, other, desc
生成的符号的"name"甚至不是空字符串。它是一个空指针，为了兼容性起见。较老的汇编器使用空指针，因此它们不会在具有空字符串的目标文件中浪费空间。
符号的值设置为位置计数器，可重新定位。程序链接时，此符号的值.stabd是汇编时位置计数器的地址。
.stabn type, other, desc, value
符号的名称设置为空字符串""。
.stabs string, type, other, desc, value
指定了所有五个字段。

.string "str"，.string8 "str"，.string16
"str"，.string32 "str"，.string64 "str"
将str中的字符复制到目标文件中。您可以指定要复制的多个字符串，以逗号分隔。除非为特定机器另行指定，否则汇编器用0字节标记每个字符串的结尾。您可以使用字符串中描述的任何转义序列。
变体string16，string32和string64从不同string在于从每个8位字符的伪码str被复制并分别扩展到16位，32位或64位。扩展字符以目标字节序字节顺序存储。
例如：
.string32 "BYE"
扩展为：
.string "B\0\0\0Y\0\0\0E\0\0\0" /*在小端目标上。*/
.string "\0\0\0B\0\0\0Y\0\0\0E" /*在大端目标上。*/

.struct expression
切换到绝对节，并将section offset设置为expression，它必须是绝对表达式。您可以使用如下：
.struct 0
field1：
.struct field1 + 4
field2：
.struct field2 + 4
field3：
这将定义符号field1的值为0，符号field2的值为4，符号field3的值为8。汇编将保留在绝对节中，您需要使用.section某种类型的指令来更改在进一步汇编之前到其他节。

.subsection name
这是ELF部分堆栈操作指令之一。其他的.section（参见section），.pushsection（参见pushsection），.popsection（参见popsection）和.previous（参见previous）。
该指令用name替换当前subsection。当前节未更改。将替换的子节放在节堆栈上代替当前堆栈子节。

.symver
使用该.symver指令将符号绑定到源文件中的特定版本节点。这仅在ELF平台上受支持，通常在汇编要链接到共享库的文件时使用。在某些情况下，在对象中使用它来绑定到应用程序本身以便从共享库中覆盖版本化符号可能是有意义的。
对于ELF目标，该.symver指令可以像这样使用：
.symver name，name2@nodename
如果符号名称是在正在汇编的文件中定义的，则该.symver指令有效地创建了一个名称为name2@nodename的符号别名，实际上我们不尝试创建常规别名的主要原因是@字符是不允许使用符号名称。的NAME2名称的一部分是通过其将要外部引用符号的实际名称。这个名字的名字 本身只是为了方便被使用，因此，它可能有一个源文件中的一个函数的多个版本定义，这样编译器可以明确地知道被提及的一个函数的版本的名称。该节点名称别名的一部分应该是在构建共享库时提供给链接器的版本脚本中指定的节点的名称。如果您尝试从共享库中覆盖版本化符号，则nodename应对应于您尝试覆盖的符号的节点名。
如果未在正在汇编的文件中定义符号名称，则对name的所有引用都将更改为name2@nodename。如果未对name进行引用，则将从符号表中删除name2@nodename。
该.symver指令的另一个用法是：
.symver name，name2 @@ nodename
在这种情况下，符号名称必须存在并在正在汇编的文件中定义。它类似于name2@nodename。区别在于name2@@nodename也将用于解析链接器对name2的引用。
该.symver指令的第三种用法是：
.symver name，name2@@@nodename
如果未在正在汇编的文件中定义name，则将其视为name2@nodename。当name被该文件被汇编内定义，符号名称，name，将改为name2@@nodename。

.tag structname
该指令由编译器生成，以在符号表中包含辅助调试信息。它只允许在.def/.endef中出现。标签用于将符号表中的结构定义与这些结构的实例相链接。

.text subsection
告知as将以下语句汇总​​到文本小节编号subsection的末尾，这是一个绝对表达式。如果subsection被省略，则subsection数字零被使用。

title "heading"
生成汇编列表时，使用heading作为标题（第二行，紧跟源文件名和页号之后）。
此指令会影响后续页，如果它出现在页面顶部的十行内，则会影响当前页。

.type
该指令用于设置符号的类型。
COFF版本
对于COFF目标，此指令仅允许出现在.def/.endef中。它使用如下：
.type int
这会将整数int记录为符号表条目的type属性。
ELF版本
对于ELF目标，该.type指令使用如下：
.type name, type description
这将符号名称的类型设置为函数符号或对象符号。type description字段支持五种不同的语法，以便提供与各种其他汇编器的兼容性。
因为这些语法中使用了一些字符（例如'@'和'＃'）是某些体系结构的注释字符，下面的一些语法不适用于所有体系结构。GNU汇编程序将在所有体系结构上接受第一个变体，因此如果您不需要将代码与其他汇编程序汇编，则应使用变量以实现最大的可移植性。
支持的语法是：
  .type <name> STT_ <TYPE_IN_UPPER_CASE>
  .type <name>，＃<type>
  .type <name>，@ <type>
  .type <name>，％<type>
  .type <name>，“<type>”
支持的类型有：
STT_FUNC
function
将符号标记为函数名称。
STT_GNU_IFUNC
gnu_indirect_function
在重定位处理期间评估时，将符号标记为间接函数（这仅适用于面向GNU系统的汇编程序）。
STT_OBJECT
object
将符号标记为数据对象。
STT_TLS
tls_object
将符号标记为线程局部数据对象。
STT_COMMON
common
将符号标记为公共数据对象。
STT_NOTYPE
notype
不以任何方式标记符号。它只是为了完整性而受到支持。
gnu_unique_object
将符号标记为全局唯一数据对象。动态链接器将确保在整个过程中只有一个符号使用此名称和类型。（这仅适用于面向GNU系统的汇编程序）。
注意：除了上面列出的类型之外，某些目标还支持其他类型。

.uleb128 expressions
uleb128代表"unsigned little endian base 128"。这是DWARF符号调试格式使用的可变长度表示数字的缩写。参见.sleb128。

.val addr
该指令仅出现在.def/.endef中，它将地址addr记录为符号表条目的value属性。

.version "string"
该指令创建一个.note节，并在其中放置一个类型为NT_VERSION的ELF格式的注释。备注的名称设置为string。

.vtable_entry table, offset
此指令查找或创建一个符号表，并为其创建一个VTABLE_ENTRY重新定位，其offset为加数。

.vtable_inherit child, parent
此指令查找符号子项并查找或创建符号父级，然后为其加数为子符号值的父级创建VTABLE_INHERIT重新定位。作为特殊情况，0的父名称被视为指向*ABS*节。

.warning "string"
类似于指令.error（参见.error "string"），但只发出警告。

.weak names
此指令设置符号names的逗号分隔列表中的weak属性。如果符号不存在，将创建它们。
在非PE的COFF目标上，weak符号是GNU扩展。此指令设置符号names的逗号分隔列表中的weak属性。如果符号不存在，将创建它们。
在PE目标上，weak符号本地支持为weak别名。当创建的weak符号不是别名时，GAS会创建一个备用符号来保存默认值。

.weakref alias, target
该指令为目标符号创建一个别名，该别名使符号能够以weak符号语义引用，但实际上不会使其变weak。如果存在符号的直接​​引用或定义，则符号不会weak，但如果对它的所有引用都是通过weak引用，则符号表中的符号将被标记为weak。
效果相当于将对别名的所有引用移动到单独的汇编源文件，将别名重命名为其中的符号，在那里将符号声明为weak，并运行可重新加载的链接以合并由组件生成的对象文件新源文件和删除了别名引用的旧源文件。
别名本身永远不会对符号表进行处理，并且完全在汇编器中处理。

.word expressions
该指令要求使用逗号分隔的任何节的零个或多个表达式。
发出的数字的大小及其字节顺序取决于汇编所针对的目标计算机。
警告：支持编译器的特殊处理
具有32位地址空间但小于32位寻址的机器需要以下特殊处理。如果您感兴趣的计算机执行32位寻址（或不需要它；参见计算机依赖性），则可以忽略此问题。
为了将编译器输出汇编到工作中，偶尔会对".word"指令进行一些奇怪的操作。表单".word sym1-sym2" 的指令通常由编译器作为跳转表的一部分发出。因此, 当将表单的指令汇编为".word sym1-sym2" 时，sym1和sym2之间的差异不适合16位, 如在下一个标签之前创建一个辅助跳转表。此次跳转表前面有一个短跳转到辅助表后的第一个字节。这种短跳转防止控制流意外落入新表中。在表里面是一个跳远到sym2。原来的".word"包含sym1减去长跳转到sym2的地址。
如果在第二个跳转表之前出现了几个".word sym1-sym2"，则所有这些事件都被调整。如果有一个'.word sym3-sym4'，这也不适合十六位，一个跳远到sym4是包括在次跳转表中，和.word指令调整为包含sym3减去长跳转到sym4的地址；还有，对于在原始跳转表中的许多条目是必要的。

.zero size
此指令发出size为0值的字节。size必须是绝对表达式。此指令实际上是".skip"指令的别名, 因此在可以将值的可选第二个参数存储在字节而不是零中。然而，用这种方式使用"零"会让人迷惑。

.2byte expression [, expression]*
此指令期望零个或多个表达式，用逗号分隔。如果没有表达式，则指令不进行任何运算。否则，使用目标的字节序模型依次计算每个表达式并将其置于当前输出节的下一个两个字节内。如果表达式不能容纳两个字节，则会显示一条警告消息，并使用表达式值的最不重要的两个字节。如果无法在程序集时间计算表达式，则将生成迁移，以便在链接时间计算值。
此指令在插入值之前或之后不应用任何对齐方式。因此，如果生成了迁移，则它们可能与用于以保证对齐方式插入值的方法不同。
此指令仅适用于ELF目标。

.4byte expression [, expression]*
就像.2byte指令，除了它将未对齐的四字节长值插入输出。

.8byte expression [, expression]*
就像.2byte指令，除了它将未对齐的八字节长值插入输出。

## AArch64机器指令

.arch name
选择目标体系结构。name的有效值对于-march 命令行选项是相同的。
指定.arch清除以前选择的任何体系结构扩展。

.arch_extension name
在目标体系结构中添加或删除体系结构扩展。name的有效值与作为体系结构扩展接受的值相同-mcpu命令行选项。
.arch_extension 可以多次使用，以递增方式向正在编译的体系结构添加或删除扩展。

.bss
该指令切换到该.bss部分。

.cpu name
设置目标处理器。name的有效值与接受的值相同-mcpu=命令行选项。

.dword expressions
该.dword指令产生64位值。

.even
该.even指令在下一个偶数字节边界上对齐输出。

.inst expressions
将表达式插入输出中，就好像它们是指令而不是数据一样。

.ltorg
此伪指令使文本池的当前内容转储到当前位置（假定为.text节）的当前位置（与字边界对齐）。GAS为每个部分和每个子部分维护一个单独的文字池。该.ltorg指令仅影响当前节和子节的文字池。在汇编结束时，将自动转储所有剩余的非空文字池。
注意：旧版本的GAS会在发生部分更改时转储当前文字池。这已不再有用，因为它阻止了对文字池放置的准确控制。

.pool
这是.ltorg的同义词。

name .req register name
这会为名为name的寄存器名称创建别名。例如：
foo .req w0
ip0，ip1，lr和fp分别自动定义为X16，X17，X30和X29的别名。

.tlsdescadd
在下一条指令上发出TLSDESC_ADD reloc。

.tlsdesccall
在下一条指令上发出TLSDESC_CALL reloc。

.tlsdescldr
在下一条指令上发出TLSDESC_LDR reloc。

.unreq alias-name
这取决于先前使用该req指令定义的寄存器别名。例如：
foo .req w0
.unreq foo
如果名称未定义，则会发生错误。注意：此伪操作可用于删除寄存器名称别名中的内置（例如'w0'）。只有在真的有必要时才应该这样做。

.xword expressions
该.xword指令产生64位值。这与.dword指令相同。

## Alpha汇编器指令

as因为Alpha支持许多其他指令以与本机汇编程序兼容。本节仅简要介绍它们。
这些是asAlpha 的附加指令：

.arch cpu
指定目标处理器。这相当于-mcpu命令行选项。有关cpu的值列表，参见选项。

.ent function[, n]
标记功能的开头。为了与OSF/1汇编程序兼容，可以使用可选数字，但会被忽略。生成.mdebug信息时，这将为该函数创建一个过程描述符。在ELF中，它将符号标记为泛型.type指令的函数a-la 。

.end function
标记功能的结束。在ELF中，它将设置符号a-la的大小为泛型.size指令。

.mask mask, offset
指示哪个整数寄存器保存在当前函数的堆栈帧中。 掩码被解释为位掩码，其中位n设置表示寄存器n被保存。寄存器保存在一个块中，该块位于规范帧地址（CFA）的偏移字节中，该地址是进入函数时的堆栈指针的值。除了$26首先保存返回地址寄存器（正常）外，寄存器按顺序保存。
这个和描述堆栈帧的其他指令目前仅在生成.mdebug信息时使用。它们将来可能用于生成.debug_frame手写汇编的DWARF2 展开信息。

.fmask mask, offset
指示哪些浮点寄存器保存在当前堆栈帧中。该掩模和偏移参数被解释为与.mask。

.frame framereg, frameoffset, retreg[, argoffset]
描述堆栈框架的形状。使用的帧指针是framereg；通常这是$fp或$sp。帧指针是CFA下面的帧偏移字节。返回地址最初位于retreg中，直到按照指示保存为止.mask。为了与OSF/1兼容，接受并忽略可选的 argoffset参数。它被认为表示从CFA到保存的参数寄存器的偏移。

.prologue n
指示堆栈帧已设置且所有寄存器已溢出。参数n表示函数是否以及如何使用传入过程向量（被调用函数的地址）$27。0表示$27未使用; 1表示该函数的前两个指令$27 用于执行GP寄存器的加载; 2表示$27以某种非标准方式使用，因此链接器在放松期间不能忽略过程向量的负载。

.usepv function, which
用于表示$27寄存器的使用，类似于.prologue，但没有需要在open .ent/.end块中的其他语义。
在该参数应该是no，表示 $27不使用，或者std，表示该函数的前两个指令执行GP负载。
.prologue如果您还使用dwarf2 CFI指令，则可以使用此指令。

.gprel32 expression
计算表达式中的地址与当前目标文件的GP之间的差异，并将其存储为4个字节。除了小于完整的8字节地址外，在共享库中使用时，这也不需要动态重定位。

.t_floating expression
将表达式存储为IEEE双精度值。

.s_floating expression
将表达式存储为IEEE单精度值。

.f_floating expression
将表达式存储为VAX F格式值。

.g_floating expression
将表达式存储为VAX G格式值。

.d_floating expression
将表达式存储为VAX D格式值。

.set feature
启用或禁用各种汇编程序功能。使用该功能的正面名称可以在使用时启用'nofeature'禁用。
at
表示宏扩展可能破坏汇编程序临时（$at或$28）寄存器。如果没有这个，某些宏可能无法展开，如果noat生效则会生成错误消息。当at有效时，如果将产生一个警告$at，使用由程序员。
macro
启用宏指令的扩展。请注意，实际指令的变体（例如br labelvs）br $31,label被视为替代形式而非宏。
move
reorder
volatile
它们控制汇编程序是否以及如何重新排序指令。接受与OSF/1汇编程序的兼容性，但as不执行指令调度，因此忽略这些功能。

以下指令是为了与OSF / 1汇编程序兼容而被识别，但会被忽略。
.proc .aproc
.reguse .livereg
.option .aent
.ugen .eflag
.alias .noalias

## ARM机器指令

.align expression [, expression]
这是通用的.align指令。但是对于ARM，如果第一个参数为零（即不需要对齐），汇编器的行为就好像参数为2（即填充到下一个四字节边界）。这是为了与ARM自己的汇编程序兼容。

.arch name
选择目标体系结构。name的有效值与。的有效值相同-游行 命令行选项。
指定.arch清除以前选择的任何体系结构扩展。

.arch_extension name
在目标体系结构中添加或删除体系结构扩展。name的有效值与作为体系结构扩展接受的值相同-mcpu和 -march 命令行选项。
.arch_extension可以多次使用，以递增方式向正在编译的体系结构添加或删除扩展。

.arm
这与.code 32执行相同的操作。

.bss
该指令切换到该.bss部分。

.cantunwind
防止通过当前函数展开。不需要或不允许个性例程或异常表数据。

.code [16|32]
该指令选择正在生成的指令集。值16选择Thumb，值32选择ARM。

.cpu name
选择目标处理器。name的有效值等同于-mcpu命令行选项。
指定.cpu清除以前选择的任何体系结构扩展。

name .dn register name [.type] [[index]]
name .qn register name [.type] [[index]]
在dn和qn指令用于创建类型化和/或用于高级SIMD扩展（Neon）指令使用索引寄存器的别名。前者应该用于创建双精度寄存器的别名，后者用于创建四精度寄存器的别名。
如果这些指令用于创建类型化别名，则可以在Neon指令中使用这些别名，而不是在助记符之后或每个操作数之后写入类型。例如：
x .dn d2.f32
y .dn d3.f32
z .dn d4.f32 [1]
vmul x，y，z
这相当于编写以下内容：
vmul.f32 d2，d3，d4 [1]
使用dn或qn创建的别名可以使用unreq销毁。

.eabi_attribute tag, value
将EABI对象属性标记设置为value。
该标签或者是一个属性编号，或下列之一：Tag_CPU_raw_name，Tag_CPU_name，Tag_CPU_arch， Tag_CPU_arch_profile，Tag_ARM_ISA_use， Tag_THUMB_ISA_use，Tag_FP_arch，Tag_WMMX_arch， Tag_Advanced_SIMD_arch，Tag_PCS_config， Tag_ABI_PCS_R9_use，Tag_ABI_PCS_RW_data， Tag_ABI_PCS_RO_data，Tag_ABI_PCS_GOT_use， Tag_ABI_PCS_wchar_t，Tag_ABI_FP_rounding， Tag_ABI_FP_denormal，Tag_ABI_FP_exceptions， Tag_ABI_FP_user_exceptions，Tag_ABI_FP_number_model， Tag_ABI_align_needed，Tag_ABI_align_preserved， Tag_ABI_enum_size，Tag_ABI_HardFP_use， Tag_ABI_VFP_args，Tag_ABI_WMMX_args， Tag_ABI_optimization_goals，Tag_ABI_FP_optimization_goals， Tag_compatibility，Tag_CPU_unaligned_access， Tag_FP_HP_extension，Tag_ABI_FP_16bit_format， Tag_MPextension_use，Tag_DIV_use， Tag_nodefaults，Tag_also_compatible_with， Tag_conformance，Tag_T2EE_use， Tag_Virtualization_use
该值可以是一个number，"string"或 number, "string"根据标记。
注意：以下旧式值也可以被tag接受：Tag_VFP_arch，Tag_ABI_align8_needed， Tag_ABI_align8_preserved，Tag_VFP_HP_extension，

.even
该指令与偶数地址对齐。

.extend expression [, expression]*
.ldouble expression [, expression]*
这些指令将12byte长的双浮点值写入输出节。这些与当前的ARM处理器或ABI不兼容。

.fnend
使用展开表条目标记函数的结尾。处理此指令时会创建展开索引表条目。
如果未指定个性例程，则将使用标准个性例程0或1，具体取决于所需的展开操作码的数量。

.fnstart
使用展开表条目标记函数的开头。

.force_thumb
即使目标处理器不支持这些指令，该指令也会强制选择Thumb指令

.fpu name
选择要汇编的浮点单元。name的有效值等同于-mfpu命令行选项。

.handlerdata
标记当前函数的结尾，以及该函数的异常表条目的开头。此指令和.fnend指令之间的任何内容都将添加到异常表条目中。
必须以.personality或.personalityindex指令开头。

.inst opcode [ , … ]
.inst.n opcode [ , … ]
.inst.w opcode [ , … ]
生成与数值操作码对应的指令。.inst.n和.inst.w允许显式指定Thumb指令大小，覆盖正常的编码规则。

.ldouble expression [, expression]*
参见.extend。

.ltorg
此伪指令使文本池的当前内容转储到当前位置（假定为.text节）的当前位置（与字边界对齐）。GAS为每个部分和每个子部分维护一个单独的文字池。该.ltorg指令仅影响当前节和子节的文字池。在汇编结束时，将自动转储所有剩余的非空文字池。
注意：旧版本的版本GAS会在发生部分更改时转储当前文字池。这已不再用，因为它阻止了对文字池放置的准确控制。

.movsp reg [, #offset]
告诉unwinder，reg包含当前堆栈指针的偏移量。如果未指定offset，则假定为零。

.object_arch name
覆盖EABI对象属性部分中记录的体系结构。name的有效值与.arch指令的有效值相同。通常，当代码使用CPU功能的运行时检测时，这非常有用。

.packed expression [, expression]*
该指令将12字节压缩浮点值写入输出节。这些与当前的ARM处理器或ABI不兼容。

.pad #count
为计数字节的堆栈调整生成退绕注释。正值表示函数序言通过递减堆栈指针来分配堆栈空间。

.personality name
将当前函数的个性例程设置为name。

.personalityindex index
将当前函数的个性例程设置为EABI标准例程编号索引

.pool
这是.ltorg的同义词。

name .req register name
这会为名为name的寄存器名称创建别名。例如：
foo .req r0
.save reglist
生成退绕注释以恢复reglist中的寄存器。reglist的格式与相应的store-multiple指令相同。
核心寄存器
.save {r4，r5，r6，lr}
stmfd sp！，{r4，r5，r6，lr}
FPA寄存器
.save f4,2
sfmfd f4,2，[sp]！
VFP寄存器
.save {d8，d9，d10}
fstmdx sp！，{d8，d9，d10}
iWMMXt寄存器
.save {wr10，wr11}
wstrd wr11，[sp，＃ -  8]！
wstrd wr10，[sp，＃ -  8]！
或者
.save wr11
wstrd wr11，[sp，＃ -  8]！
.save wr10
wstrd wr10，[sp，＃ -  8]！

.setfp fpreg, spreg [, #offset]
相对于帧指针进行所有开卷注释。如果没有这个，unwinder将使用堆栈指针的偏移量。
此指令的语法与用于设置框架指针的添加或移动指令相同。spreg必须是sp或前面的.movsp指令中提到的。
.movsp ip
mov ip，sp
...
.setfp fp，ip，＃4
add fp，ip，＃4

.secrel32 expression [, expression]*
该指令发出重定位，计算每个表达式符号的节相对偏移量。该指令仅支持PE目标。

.syntax [unified | divided]
该指令设置指令集语法，如ARM-Instruction-Set节所述。

.thumb
这与.code 16执行相同的操作。

.thumb_func
该指令指定以下符号是Thumb编码函数的名称。此信息是必要的，以便允许汇编器和链接器为ARM和Thumb指令之间的互通生成正确的代码，并且即使不执行交互操作也应该使用该信息。该指令的存在也意味着.thumb。
生成EABI对象时不需要此指令。在这些目标上，生成Thumb代码时隐式编码。

.thumb_set
这执行等效的.set指令，因为它创建了一个符号，该符号是另一个符号的别名（可能尚未定义）。该指令还具有添加的属性，因为它将别名符号标记为拇指函数入口点，与.thumb_func指令的方式相同。

.tlsdescseq tls-variable
该指令用于注释内联TLS描述符trampoline的部分内容。通常，蹦床是由链接器提供的，不需要该指令。

.unreq alias-name
此取消定义这是以前使用所定义的寄存器别名 req，dn或qn指令。例如：
foo .req r0
.unreq foo
如果名称未定义，则会发生错误。注意：此伪操作可用于删除寄存器名称别名中的内置（例如'r0'）。只有在真的有必要时才应该这样做。

.unwind_raw offset, byte1, …
插入一个或多个任意展开操作码字节，已知这些字节可通过偏移字节调整堆栈指针。
例如.unwind_raw 4, 0xb1, 0x01相当于.save {r0}

.vsave vfp-reglist
使用FLDMD生成unwinder注释以恢复vfp-reglist中的VFP寄存器。也适用于要使用VLDM恢复的VFPv3寄存器。vfp-reglist的格式与相应的store-multiple指令相同。
VFP寄存器
.vsave {d8，d9，d10}
fstmdd sp！，{d8，d9，d10}
VFPv3寄存器
.vsave {d15，d16，d17}
vstm sp！，{d15，d16，d17}
由于现在不推荐使用FLDMX和FSTMX，因此应该使用该指令来支持.save为ARMv6及更高版本保存VFP寄存器。

## x86特定指令

.lcomm symbol , length[, alignment]
由符号表示的本地公用的预留长度（绝对表达式）字节。符号的部分和值是新的局部通用的。这些地址在bss部分中分配，以便在运行时字节从零开始。由于符号未声明为全局，因此它通常不可见于ld。可选的第三个参数，对齐方式，指定在bss部分中符号所需的对齐方式。
此指令仅适用于基于COFF的x86目标。

.largecomm symbol , length[, alignment]
此指令的行为方式与comm指令相同，只是数据被放到.lbss节而不是.bss节comm中。
该指令旨在用于需要大量空间的数据，并且仅适用于基于ELF的x86_64目标。

## RISC-V指令

下表列出了所有可用的RISC-V特定指令。

.align size-log-2
与给定边界对齐，其大小为log2，即要对齐的字节数。

.half value
.word value
.dword value
在当前位置发出半字，字或双字值。

.dtprelword value
.dtpreldword value
在当前位置发出DTP相关字（或双字）。这适用于编译器在共享库中用于线程局部变量的DWARF调试信息。

.bss
将当前节设置为BSS节。

.uleb128 value
.sleb128 value
在当前位置发出签名或未签名的LEB128值。这只接受常量表达式，因为符号地址可以随着松弛而改变，并且我们不支持重定位以在链接时修改LEB128值。

.option argument
修改与汇编代码一致的RISC-V特定汇编器选项。当特定指令序列必须与一组特定选项组合时，使用此方法。例如，由于我们将序列放宽到较短的GP相对序列，因此GP的初始负载不能放宽，应该像：
.option push
.option norelax
la gp，__ global_pointer $
.option pop
为了在连接器放松期望后制作：
auipc gp，％pcrel_hi（__ global_pointer $）
addi gp，gp，％pcrel_lo（__ global_pointer $）
而不仅仅是
addi gp，gp，0
在常规使用期间，不期望选项以这种方式改变，但是有一些深奥的情况，例如上面那些用户需要为特定代码序列禁用汇编器的特定功能的情况。选项参数的完整列表如下所示：
push
pop
压入或弹出当前选项堆栈。只要根据汇编代码更改选项，就应该使用这些选项，以确保对正在汇编的文件的大部分使用用户的命令行选项。
rvc
norvc
启用或禁用压缩指令的生成。尽可能由RISC-V汇编程序机会性地压缩指令，但有时这种行为是不可取的。
pic
nopic
启用或禁用与位置无关的代码生成。除非你真的知道你在做什么，否则这应该只是在文件的顶部。
relax
norelax
启用或禁用放松。RISC-V汇编器和链接器机会性地放松一些代码序列，但有时这种行为是不可取的。

.insn value
.insn value
此指令允许指令的数字表示, 并使汇编器根据".insn"（参见RISC-V-Formats）的一种指令格式插入操作数。例如，"add a0、a1、a2"等指令可以写成".insn r 0x33, 0, 0, a0, a1, a2"。
