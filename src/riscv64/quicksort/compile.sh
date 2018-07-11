riscv64-linux-gnu-as -g -o main.o main.S
riscv64-linux-gnu-as -g -o quicksort.o quicksort.S
riscv64-linux-gnu-ld -o quicksort main.o quicksort.o
rm -r *.o
