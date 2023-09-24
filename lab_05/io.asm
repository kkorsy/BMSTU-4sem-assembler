PUBLIC input_cmd
PUBLIC print_menu
PUBLIC input_num
PUBLIC print_new_line
PUBLIC NUM

DSEG SEGMENT public 'DATA'
	NEW_LINE db 13, 10, "$"
DSEG ENDS

SD1 SEGMENT para public 'DATA'
	db 7 	; Макс длина строки
	LEN db 0 	; Реальная длина строки
	S db 7 dup (0)
SD1 ENDS

MENU_SEG SEGMENT para public 'DATA'
	MENU db "Actions:", 13, 10
	db "1. Input signed decimal number", 13, 10
	db "2. Convert to unsigned hexadecimal", 13, 10
	db "3. Convert to signed binary", 13, 10
	db "0. Exit program", 13, 10, 10
	db "Choose action: $"
MENU_SEG ENDS

NUM_SEG SEGMENT para public 'DATA'
	NUM dw 0
NUM_SEG ENDS

CSEG SEGMENT para public 'CODE'
	ASSUME DS:SD1, ES:NUM_SEG
input_num proc near
	push ds
	mov ax, SD1
	mov ds, ax
	mov ax, NUM_SEG
	mov es, ax
	
	mov NUM, 0
	mov ah, 10
	mov dx, 0
	int 21h
	
	xor cx, cx
	mov cl, LEN
	mov si, cx
	dec si
	mov bx, 1
	convert_loop:
		cmp si, 0
		jne digit
		cmp S[si], "-"
		jne digit
		neg NUM
		jmp end_loop
		
		digit:
		xor ax, ax
		mov al, S[si]
		sub al, '0'
		mul bx
		add NUM, ax
		
		mov ax, bx
		mov dx, 10
		mul dx
		mov bx, ax
		
		dec si
		loop convert_loop
	end_loop:
	pop ds
	ret
input_num endp

print_new_line proc near
	push ds
	mov AX, DSEG
	mov DS, AX
	
	mov DX, OFFSET NEW_LINE
	mov AH, 09h
	int 21h
	
	mov ax, NUM_SEG
	mov ds, ax
	
	pop ds
	ret
print_new_line endp

input_cmd proc near
	xor AX, AX
	mov AH, 01h
	int 21h
	
	sub AL, '0'
	
	xor BX, BX
	mov BL, 2h
	mul BL
	
	xor SI, SI
	mov SI, AX	; в SI введенная команда
	
	call print_new_line
	ret
input_cmd endp

print_menu proc near
	push ds
	mov AX, MENU_SEG
	mov DS, AX
	
	mov DX, OFFSET MENU
	mov AH, 09h
	int 21h
	
	mov ax, NUM_SEG
	mov ds, ax
	
	pop ds
	ret
print_menu endp

CSEG ENDS
END