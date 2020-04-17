; boot.asm
;-------------------------------------------------------------------------------
%include "stdout.asm"

; Origin address, specifies the address at which the output code will be loaded.
[ORG 0x7c00]

main:
	;mov ax, 0x07c0		; mov offset in accumulator
	xor ax, ax
	mov ds, ax		; mov ax in data segment
	cld			; Clear Direction Flag (DF)
	; if DF=0, string operations increment the index registers (SI/DI)

	BiosPrint msg

hang:
	jmp hang

msg db 'hello world', 13, 10, 0	; "hello world" CR LF '\0'

;-------------------------------------------------------------------------------
	; BIOS reads one sector from drive into 00007C00h. If read is succesful
	; and the boot record contains 0xAA55 as the last two bytes, then
	; control is transferred. Don't forget Intel = Little Endian.
	; 1010 1010 0101 0101 is "probably" signing protection
	times 510-($-$$) db 0
	db 0x55
	db 0xAA
