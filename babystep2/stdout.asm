; stdout.asm
;-------------------------------------------------------------------------------

; %macro name min_parameters
%macro BiosPrint 1
	mov si, word %1

ch_loop:
	lodsb			; load string
				; due to DF=0, si = si +1
	or al, al		; 0=end else char
	jz done
	mov ah, 0x0E
	int 0x10
	jmp ch_loop
done:
%endmacro

