#define dst a0
#define src a1
#define len a2

strcmp:
1:
	lbu t0, 0(a0)
	addu a0, a0, 1        # a0-a3, 函数参数
	lbu t1, 0(a1)
	addu a1, a1, 1

	beq t0, zero, .t01
	beq t1, zero, .t01
	beq t0, t1, 1b        # 1f 下一个标号， 1b 上一个标号

.t01:
	subu v0, t0, t1       # v0,v1: 函数返回值
	j ra                  # ra, $31, 子程序返回的地址
