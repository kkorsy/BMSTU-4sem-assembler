EXTRN input_cmd: near
EXTRN input_num: near
EXTRN print_menu: near
EXTRN print_hex: near
EXTRN print_bin: near

SSTK SEGMENT para STACK 'STACK'
	db 100 dup (?)
SSTK ENDS

ACTIONS_SEG SEGMENT para public 'DATA'
	ACTIONS dw exit, input_num, print_hex, print_bin
ACTIONS_SEG ENDS

CSEG SEGMENT para public 'CODE'
	ASSUME DS:ACTIONS_SEG
main:
	mov AX, ACTIONS_SEG
	mov DS, AX
	menu_loop:
		call print_menu
		
		call input_cmd
		call ACTIONS[si]
		jmp menu_loop
		
exit proc near
	mov AX, 4c00h
	int 21h
exit endp

CSEG ENDS
END main
