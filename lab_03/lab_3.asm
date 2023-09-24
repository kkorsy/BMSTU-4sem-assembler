STK SEGMENT para STACK 'STACK'
	db 100 dup (0)
STK ENDS

SD1 SEGMENT para public 'DATA'
	db 255 	; Макс длина строки
	db 0 	; Реальная длина строки
	db 255 dup (?)
SD1 ENDS

SD2 SEGMENT para public 'DATA'
	db 2 dup (0)
SD2 ENDS

CSEG SEGMENT para public 'CODE'
	assume DS:SD1, ES:SD2
main:
	mov AX, SD1
	mov DS, AX
	mov DX, 0
	
	mov AX, SD2
	mov ES, AX
	
	mov AH, 0Ah
	int 21h
	
	mov BH, SD1:3
	mov CH, SD1:6
	add BH, CH
	sub BH, 2 * '0'
	
	mov SD2:1, BH
	
	mov AX, 4c00h
	int 21h
CSEG ENDS
END main
	
	

