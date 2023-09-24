SSTK SEGMENT para STACK 'STACK'
	db 100 dup (?)
SSTK ENDS

MSGS SEGMENT para public 'DATA'
	N_MSG db "Enter N: $"
	M_MSG db "Enter M: $"
	MATRIX_MSG db "Enter matrix: $"
	RES_MSG db "Result: $"
	NEW_LINE db 13, 10, "$"
	SPACE db " $"
MSGS ENDS

SEG_MATRIX SEGMENT para public 'DATA'
	N db 0
	M db 0
	N_MAX db 9
	M_MAX db 9
	MATRIX db 9 * 9 dup(0)
SEG_MATRIX ENDS

CSEG SEGMENT para public 'CODE'
	assume DS:MSGS, ES:SEG_MATRIX
print_msg:
	mov AH, 09h
	int 21h
	
	ret
read_element:
	mov AH, 01h
	int 21h
	sub AL, '0'
	
	ret
read_matrix:
	xor AX, AX
	mov AL, N_MSG
	mov DX, OFFSET N_MSG
	call print_msg
	
	call read_element
	mov N, AL
	mov AL, NEW_LINE
	mov DX, OFFSET NEW_LINE
	call print_msg
	
	xor AX, AX
	mov AL, M_MSG
	mov DX, OFFSET M_MSG
	call print_msg
	
	call read_element
	mov M, AL
	mov AL, NEW_LINE
	mov DX, OFFSET NEW_LINE
	call print_msg
	
	xor AX, AX
	mov AL, MATRIX_MSG
	mov DX, OFFSET MATRIX_MSG
	call print_msg
	mov AL, NEW_LINE
	mov DX, OFFSET NEW_LINE
	call print_msg
	
	xor BX, BX
	xor CX, CX
	mov CL, N
	read_row:
		xor SI, SI
		push CX
		mov CL, M
		
		read_loop:
			call read_element
			mov matrix[bx][si], AL
			inc si
			
			mov AL, SPACE
			mov DX, OFFSET SPACE
			call print_msg
			
			loop read_loop
		add BL, M_MAX
		
		mov AL, NEW_LINE
		mov DX, OFFSET NEW_LINE
		call print_msg
		
		pop CX
		loop read_row
	
	ret
print_elem:
	mov AH, 02h
	int 21h
	
	ret
print_matrix:
	mov AL, RES_MSG
	mov DX, OFFSET RES_MSG
	call print_msg
	mov AL, NEW_LINE
	mov DX, OFFSET NEW_LINE
	call print_msg
	
	xor BX, BX
	xor CX, CX
	mov CL, N
	
	print_row:
		xor SI, SI
		push CX
		mov CL, M
		
		print_loop:
			mov DL, matrix[bx][si]
			add DL, "0"
			call print_elem
			inc si
			
			mov AL, SPACE
			mov DX, OFFSET SPACE
			call print_msg
			
			loop print_loop
		add BL, M_MAX
		
		mov AL, NEW_LINE
		mov DX, OFFSET NEW_LINE
		call print_msg
		
		pop CX
		loop print_row
	
	ret
swap_rows:
	xor AX, AX
	xor BX, BX
	mov AL, N
	mov BL, 2
	div BL
	mov CL, AL
	
	xor BX, BX
	swap_loop:
		xor SI, SI
		push CX
		mov CL, M
		
		swap_elem:
			xchg DL, matrix[bx][si]
			add BL, M_MAX
			xchg DL, matrix[bx][si]
			sub BL, M_MAX
			xchg DL, matrix[bx][si]
			
			inc si
			loop swap_elem
		add BL, M_MAX
		add BL, M_MAX
		
		
		pop CX
		loop swap_loop
	
	ret
main:
	mov AX, MSGS
	mov DS, AX
	mov AX, SEG_MATRIX
	mov ES, AX
	
	call read_matrix
	call swap_rows
	call print_matrix
	
	mov AX, 4c00h
	int 21h
CSEG ENDS
END main
