	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	sum_float
	.type	sum_float, @function
sum_float:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movss	DWORD PTR -36[rbp], xmm0
	movss	DWORD PTR -40[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -24[rbp], 0
	jmp	.L2
.L3:
	movss	xmm0, DWORD PTR -36[rbp]
	addss	xmm0, DWORD PTR -40[rbp]
	movss	DWORD PTR -20[rbp], xmm0
	add	DWORD PTR -24[rbp], 1
.L2:
	cmp	DWORD PTR -24[rbp], 9999
	jle	.L3
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sum_float, .-sum_float
	.globl	sum_float_asm
	.type	sum_float_asm, @function
sum_float_asm:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movss	DWORD PTR -36[rbp], xmm0
	movss	DWORD PTR -40[rbp], xmm1
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -28[rbp], 0
	jmp	.L6
.L7:
#APP
# 34 "main.c" 1
	fld DWORD PTR -36[rbp]
fld DWORD PTR -40[rbp]
faddp %ST(1), %ST(0)
fstp DWORD PTR -32[rbp]

# 0 "" 2
#NO_APP
	add	DWORD PTR -28[rbp], 1
.L6:
	cmp	DWORD PTR -28[rbp], 9999
	jle	.L7
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	sum_float_asm, .-sum_float_asm
	.globl	mul_float
	.type	mul_float, @function
mul_float:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movss	DWORD PTR -36[rbp], xmm0
	movss	DWORD PTR -40[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -24[rbp], 0
	jmp	.L11
.L12:
	movss	xmm0, DWORD PTR -36[rbp]
	mulss	xmm0, DWORD PTR -40[rbp]
	movss	DWORD PTR -20[rbp], xmm0
	add	DWORD PTR -24[rbp], 1
.L11:
	cmp	DWORD PTR -24[rbp], 9999
	jle	.L12
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	mul_float, .-mul_float
	.globl	mul_float_asm
	.type	mul_float_asm, @function
mul_float_asm:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movss	DWORD PTR -36[rbp], xmm0
	movss	DWORD PTR -40[rbp], xmm1
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -28[rbp], 0
	jmp	.L15
.L16:
#APP
# 70 "main.c" 1
	fld DWORD PTR -36[rbp]
fld DWORD PTR -40[rbp]
fmulp %ST(1), %ST(0)
fstp DWORD PTR -32[rbp]

# 0 "" 2
#NO_APP
	add	DWORD PTR -28[rbp], 1
.L15:
	cmp	DWORD PTR -28[rbp], 9999
	jle	.L16
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	mul_float_asm, .-mul_float_asm
	.globl	sum_double
	.type	sum_double, @function
sum_double:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	QWORD PTR -48[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -28[rbp], 0
	jmp	.L20
.L21:
	movsd	xmm0, QWORD PTR -40[rbp]
	addsd	xmm0, QWORD PTR -48[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -28[rbp], 1
.L20:
	cmp	DWORD PTR -28[rbp], 9999
	jle	.L21
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	sum_double, .-sum_double
	.globl	sum_double_asm
	.type	sum_double_asm, @function
sum_double_asm:
.LFB11:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	QWORD PTR -64[rbp], xmm1
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L24
.L25:
#APP
# 107 "main.c" 1
	fld QWORD PTR -56[rbp]
fld QWORD PTR -64[rbp]
faddp %ST(1), %ST(0)
fstp QWORD PTR -32[rbp]

# 0 "" 2
#NO_APP
	add	DWORD PTR -36[rbp], 1
.L24:
	cmp	DWORD PTR -36[rbp], 9999
	jle	.L25
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	sum_double_asm, .-sum_double_asm
	.globl	mul_double
	.type	mul_double, @function
mul_double:
.LFB12:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	QWORD PTR -48[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -28[rbp], 0
	jmp	.L29
.L30:
	movsd	xmm0, QWORD PTR -40[rbp]
	mulsd	xmm0, QWORD PTR -48[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -28[rbp], 1
.L29:
	cmp	DWORD PTR -28[rbp], 9999
	jle	.L30
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	mul_double, .-mul_double
	.globl	mul_double_asm
	.type	mul_double_asm, @function
mul_double_asm:
.LFB13:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	QWORD PTR -64[rbp], xmm1
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L33
.L34:
#APP
# 143 "main.c" 1
	fld QWORD PTR -56[rbp]
fld QWORD PTR -64[rbp]
fmulp %ST(1), %ST(0)
fstp QWORD PTR -32[rbp]

# 0 "" 2
#NO_APP
	add	DWORD PTR -36[rbp], 1
.L33:
	cmp	DWORD PTR -36[rbp], 9999
	jle	.L34
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	mul_double_asm, .-mul_double_asm
	.globl	loaded_pi
	.type	loaded_pi, @function
loaded_pi:
.LFB14:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
#APP
# 162 "main.c" 1
	fldpi
fsin
fstp QWORD PTR -16[rbp]

# 0 "" 2
#NO_APP
	movsd	xmm0, QWORD PTR -16[rbp]
	movq	rax, xmm0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	loaded_pi, .-loaded_pi
	.section	.rodata
	.align 8
.LC3:
	.string	"x---------------x--------------- x----------------x"
	.align 8
.LC4:
	.string	"|     SUM       |     float      |     double     |"
	.align 8
.LC5:
	.string	"x---------------x----------------x----------------x"
.LC6:
	.string	"|      C        |"
.LC7:
	.string	"%16lf|%16lf|\n"
	.align 8
.LC8:
	.string	"x----------------x---------------x----------------x"
.LC9:
	.string	"|     asm       |"
	.align 8
.LC10:
	.string	"x----------------x---------------x----------------x\n"
	.align 8
.LC11:
	.string	"|      MUL      |     float      |     double     |"
	.align 8
.LC14:
	.string	"\n3.14: sin(pi) = %lf\n3.141596: sin(pi) = %lf\nloaded: sin(pi) = %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC2[rip]
	addsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	movss	DWORD PTR -40[rbp], xmm0
	pxor	xmm0, xmm0
	cvtss2sd	xmm0, DWORD PTR -40[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC2[rip]
	addsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	movss	DWORD PTR -36[rbp], xmm0
	pxor	xmm0, xmm0
	cvtss2sd	xmm0, DWORD PTR -36[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsd	xmm0, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	sum_double
	movq	rbx, xmm0
	movss	xmm0, DWORD PTR -36[rbp]
	mov	eax, DWORD PTR -40[rbp]
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	sum_float
	movq	rax, xmm0
	movq	xmm1, rbx
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsd	xmm0, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	sum_double_asm
	movq	rbx, xmm0
	movss	xmm0, DWORD PTR -36[rbp]
	mov	eax, DWORD PTR -40[rbp]
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	sum_float_asm
	movq	rax, xmm0
	movq	xmm1, rbx
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsd	xmm0, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	mul_double
	movq	rbx, xmm0
	movss	xmm0, DWORD PTR -36[rbp]
	mov	eax, DWORD PTR -40[rbp]
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	mul_float
	movq	rax, xmm0
	movq	xmm1, rbx
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsd	xmm0, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	mul_double_asm
	movq	rbx, xmm0
	movss	xmm0, DWORD PTR -36[rbp]
	mov	eax, DWORD PTR -40[rbp]
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	mul_float_asm
	movq	rax, xmm0
	movq	xmm1, rbx
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	call	loaded_pi
	movq	rax, xmm0
	movq	xmm0, rax
	call	sin@PLT
	movq	rdx, xmm0
	movsd	xmm0, QWORD PTR .LC12[rip]
	mov	rax, QWORD PTR .LC13[rip]
	movq	xmm2, rdx
	movapd	xmm1, xmm0
	movq	xmm0, rax
	lea	rax, .LC14[rip]
	mov	rdi, rax
	mov	eax, 3
	call	printf@PLT
	mov	eax, 0
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC1:
	.long	-4194304
	.long	1105199103
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC12:
	.long	2004573403
	.long	-1093922212
	.align 8
.LC13:
	.long	204214900
	.long	1062869010
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
