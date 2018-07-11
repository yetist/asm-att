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

all: cpuid cpuid2

cpuid:
	as $(AS_FLAGS) -o cpuid.o cpuid.s
	ld $(LD_FLAGS) -o cpuid cpuid.o

cpuid2:
	as $(AS_FLAGS) -o cpuid2.o cpuid2.s
	ld $(LD_FLAGS) $(LD_FLAGS2) -o cpuid2 cpuid2.o

clean:
	rm -f cpuid2.o cpuid.o cpuid cpuid2
