PUBLIC print_bin

EXTRN print_new_line: near
EXTRN NUM: word

MASK_SEG SEGMENT para public 'DATA'
	MASK_2 dw 0001h
MASK_SEG ENDS

CSEG SEGMENT para public 'CODE'
	ASSUME DS:MASK_SEG
print_bin proc near
	push ds
	mov AX, MASK_SEG
	mov DS, AX
	
	cmp ES:NUM, 0
	jge print_unsigned
	
	mov ah, 02
	mov dl, '-'
	int 21h
	neg ES:NUM
	
	print_unsigned:
	mov bx, 15
	mov cx, 16
	print_loop:
		mov ax, ES:NUM
		
		push cx
		mov cl, bl
		shr ax, cl
		pop cx
		
		and ax, MASK_2
		add al, '0'
		mov dl, al
		
		mov ah, 02
		int 21h
		
		dec bl
		
		loop print_loop
		
	pop ds
	call print_new_line
	ret
print_bin endp

CSEG ENDS
END
