X86 ?= 1
DEBUG ?=

ifdef X86
AS_FLAGS = -march=i686 --32
LD_FLAGS = -m elf_i386
else
AS_FLAGS =
LD_FLAGS =
endif

ifdef DEBUG
AS_FLAGS += -gstabs
endif

LD_FLAGS2 = -dynamic-linker /lib/ld-linux.so.2 -L/usr/lib32 -lc

#AS_FLAGS = -v -gstabs -march=i686 --32
GCC_AS_FLAGS = -Wa,$(AS_FLAGS)
GCC_FLAGS = -v -save-temps -m32

C_SRCS := $(wildcard *.c)
S_SRCS := $(wildcard *.s *.S)
A_SRCS = $(C_SRCS) $(S_SRCS)

A_BINS = $(basename $(A_SRCS))

I_TMPS = $(patsubst %,%.i,$(basename $(S_SRCS)))
C_TMPS = $(patsubst %.i,%.c,$(I_TMPS))
O_TMPS = $(patsubst %.i,%.o,$(I_TMPS))

test:
	echo $(DEBUG)
	echo $(A_BINS)

all: $(A_BINS) objs

objs: $(O_TMPS)

%.o:%.s
	as $(AS_FLAGS) -o $@ $^
%:%.o
	ld $(LD_FLAGS) -o $@ $^
#%:%.S
#	gcc $(GCC_FLAGS) $(AS_FLAGS) -o $@ $^
#%:%.c
#	gcc $(GCC_FLAGS) $(AS_FLAGS) -o $@ $^

clean:
	@rm -f $(A_BINS) $(I_TMPS) $(C_TMPS) $(O_TMPS)
