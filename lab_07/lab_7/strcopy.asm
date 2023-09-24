.686
.MODEL FLAT, C
.STACK

.CODE

;char *src, char *dst, int len
;	   esi,		  edi,	   ecx

strcopy_asm PROC
	push esi
	push edi
	push ecx
	push ebp

	mov ebp, esp
	add ebp, 12

	mov esi, [ebp + 8]
	mov edi, [ebp + 12]
	mov ecx, [ebp + 16]

	mov eax, edi

	pop ebp

	cmp esi, edi
	je quit
	jg simple

	back:
		add esi, ecx
		add edi, ecx
		std				; флаг направления
		jmp copy
	
	simple:
		cld
		jmp copy

	copy:
		add ecx, 1
		rep movsb 

	quit:
		cld
		pop ecx
		pop esi
		pop edi
		ret
strcopy_asm ENDP

END
