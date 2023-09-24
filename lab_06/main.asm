.MODEL TINY
.186

CSEG SEGMENT para public 'CODE'
	ORG 100h 					; размер PSP
	assume CS:CSEG, DS:CSEG
main:
	jmp init
	
	speed db 11111b
	tact db 17
	
breaking:
	push AX
	
	mov al, 20h
	out 20h, al
	
	inc tact
	cmp tact, 18
	jne end_breaking
	
	mov tact, 0
	
	mov al, 0F3h
	out 60h, al
	
	mov al, speed
	out 60h, al
	
	dec speed
	and speed, 00011111b
	;cmp speed, 0
	;jz reset
	
	;jmp end_breaking
	
	reset:
	;	mov speed, 11111b
		
	end_breaking:
		pop AX
		
		JUMP db 0eah 	; код jmp
		ARG_1 dw 0
		ARG_2 dw 0
	
init:
	mov ah, 35h		; получить адрес обработчика прерываний
	mov al, 08h		; таймер
	int 21h
	
	mov ARG_1, bx
	mov ARG_2, es
	
	mov dx, offset breaking
	cmp bx, dx
	je remove
	
	mov ah, 25h		; установить адрес нового обработчика
	mov al, 08h
	int 21h
	
	mov dx, offset init  ; начиная с init можно удалить
	int 27h
	
remove:
	pusha
	
	mov dx, ES:ARG_1
	mov ax, ES:ARG_2
	mov ds, ax
	
	mov ah, 25h
	mov al, 08h
	int 21h
    
    mov al, 0F3h
	out 60h, al
	
	mov al, 0
	out 60h, al
    
    popa
    
    mov ah, 49h 	; освободить память
	int 21h
    
    mov ax, 4c00h
    int 21h
CSEG ENDS
END main
