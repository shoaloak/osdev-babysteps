all: boot run

boot: boot.asm
	nasm boot.asm -o boot.bin

run: boot.bin
	qemu-system-i386 -fda boot.bin
