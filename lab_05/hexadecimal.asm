PUBLIC print_hex

EXTRN print_new_line: near
EXTRN NUM: word

MASK_SEG SEGMENT para public 'DATA'
	MASK_16 dw 000fh
MASK_SEG ENDS

CSEG SEGMENT para public 'CODE'
	ASSUME DS:MASK_SEG
print_hex proc near
	push ds
	mov AX, MASK_SEG
	mov DS, AX
	
	mov bx, 12
	mov cx, 4
	print_loop:
		mov ax, ES:NUM
		
		push cx
		mov cl, bl
		shr ax, cl
		pop cx
		
		and ax, MASK_16
		call convert_to_digit
		
		mov ah, 02
		int 21h
		
		sub bl, 4
		
		loop print_loop
		
	pop ds
	call print_new_line
	ret
print_hex endp

convert_to_digit proc near
	cmp ax, 10
	jb digit
	
	symb:
		sub ax, 10
		add ax, 'A'
		jmp stop
	
	digit:
		add ax, '0'
		
	stop:
		mov dl, al
		ret
convert_to_digit endp

CSEG ENDS
END
