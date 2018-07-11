all:
	riscv64-linux-gnu-as --traditional-format -march=rv64gc -mabi=lp64d -o hello.o hello.S
	riscv64-linux-gnu-ld -dynamic-linker /usr/riscv64-linux-gnu/lib/ld-linux-riscv64-lp64d.so.1 -lc -rpath=/usr/riscv64-linux-gnu/lib/ -o hello hello.o
