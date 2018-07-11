ARCH = x86

-include ../Makefile.header

LD_FILE = boot.ld          #使用连接脚本 boot.ld
LD_FLAGS += -T$(LD_FILE)

TARGETS = boot-i686.img floppy-i686.img

-include ../Makefile.inc

CLEAN_FILES   +=  *.img

%.bin: %.elf
	@echo "OBJDUMP $@"
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary $^ $@

%.img: %.bin
	dd if=/dev/zero of=$@ bs=512 count=2880
	dd if=$^ of=$@ conv=notrunc bs=512 count=1

run-boot:
	qemu-system-i386 -fda boot-i686.img

run-floppy:
	qemu-system-i386 -fda floppy-i686.img
