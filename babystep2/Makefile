.DEFAULT_GOAL := boot

all: boot run

boot: boot.asm stdout.asm
	nasm boot.asm -o boot.bin

run: boot.bin
	# set boot.bin as floppy disk 1
	qemu-system-i386 -fda boot.bin

debug: boot.bin
	qemu-system-i386 -fda boot.bin -s
	#(gdb) target remote :1234

dump: boot.bin
	objdump -D -b binary -mi386 -Maddr16,data16 mbr boot.bin
