.section	__TEXT, __text
	.globl	_main
	.globl	read_string
	.globl	compare_strings
	.globl	print_boolean
	.globl	string_length
	.globl	print_string
	.globl	print_uint64
_main:
	push	%rbp
	mov 	%rsp, %rbp
	subq	$0, %rsp
	movq	decl_2@GOTPCREL(%rip), %rsi
	movq	%rbp, (%rsi)
/*init*/
	call	t_main
	mov 	$0x02000001, %rax
	xor 	$0, %rdi
	syscall
/*t_quicksortAux: skip*/
t_quicksortAux:
/*pmb s0*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$216, %rsp
/*t0 = left * 8*/
	movq	24(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -40(%rbp)
/*t0 = t0 + 8*/
	movq	-40(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -40(%rbp)
/*t1 = arr[t0]*/
	movq	16(%rbp), %rax
	movq	-40(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
/*pivot = t1*/
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
/*i = left*/
	movq	24(%rbp), %rax
	movq	%rax, -56(%rbp)
/*j = right*/
	movq	32(%rbp), %rax
	movq	%rax, -64(%rbp)
/*e0: skip*/
e0:
/*if i < j goto e1*/
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e1
1:
/*t2 = 0*/
	movb	$0, %al
	movb	%al, -65(%rbp)
/*goto e2*/
	jmp 	e2
/*e1: skip*/
e1:
/*t2 = -1*/
	movb	$-1, %al
	movb	%al, -65(%rbp)
/*e2: skip*/
e2:
/*if t2 = 0 goto e3*/
	movb	-65(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e3
1:
/*e4: skip*/
e4:
/*t3 = i * 8*/
	movq	-56(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -73(%rbp)
/*t3 = t3 + 8*/
	movq	-73(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -73(%rbp)
/*t4 = arr[t3]*/
	movq	16(%rbp), %rax
	movq	-73(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -81(%rbp)
/*if t4 <= pivot goto e5*/
	movq	-81(%rbp), %rax
	movq	-32(%rbp), %rbx
	cmpq	%rbx, %rax
	ja 	1f
	jmp	e5
1:
/*t5 = 0*/
	movb	$0, %al
	movb	%al, -82(%rbp)
/*goto e6*/
	jmp 	e6
/*e5: skip*/
e5:
/*t5 = -1*/
	movb	$-1, %al
	movb	%al, -82(%rbp)
/*e6: skip*/
e6:
/*if i < j goto e7*/
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e7
1:
/*t6 = 0*/
	movb	$0, %al
	movb	%al, -83(%rbp)
/*goto e8*/
	jmp 	e8
/*e7: skip*/
e7:
/*t6 = -1*/
	movb	$-1, %al
	movb	%al, -83(%rbp)
/*e8: skip*/
e8:
/*t7 = t5 and t6*/
	movb	-82(%rbp), %al
	movb	-83(%rbp), %bl
	andb	%bl, %al
	movb	%al, -84(%rbp)
/*if t7 = 0 goto e9*/
	movb	-84(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e9
1:
/*i = i + 1*/
	movq	-56(%rbp), %rax
	movq	$1, %rbx
	addq	%rbx, %rax
	movq	%rax, -56(%rbp)
/*goto e4*/
	jmp 	e4
/*e9: skip*/
e9:
/*e10: skip*/
e10:
/*t9 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -92(%rbp)
/*t9 = t9 + 8*/
	movq	-92(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -92(%rbp)
/*t10 = arr[t9]*/
	movq	16(%rbp), %rax
	movq	-92(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -100(%rbp)
/*if t10 > pivot goto e11*/
	movq	-100(%rbp), %rax
	movq	-32(%rbp), %rbx
	cmpq	%rbx, %rax
	jle 	1f
	jmp	e11
1:
/*t11 = 0*/
	movb	$0, %al
	movb	%al, -101(%rbp)
/*goto e12*/
	jmp 	e12
/*e11: skip*/
e11:
/*t11 = -1*/
	movb	$-1, %al
	movb	%al, -101(%rbp)
/*e12: skip*/
e12:
/*if t11 = 0 goto e13*/
	movb	-101(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e13
1:
/*j = j - 1*/
	movq	-64(%rbp), %rax
	movq	$1, %rbx
	subq	%rbx, %rax
	movq	%rax, -64(%rbp)
/*goto e10*/
	jmp 	e10
/*e13: skip*/
e13:
/*if i < j goto e14*/
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e14
1:
/*t13 = 0*/
	movb	$0, %al
	movb	%al, -102(%rbp)
/*goto e15*/
	jmp 	e15
/*e14: skip*/
e14:
/*t13 = -1*/
	movb	$-1, %al
	movb	%al, -102(%rbp)
/*e15: skip*/
e15:
/*if t13 = 0 goto e0*/
	movb	-102(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e0
1:
/*t14 = i * 8*/
	movq	-56(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -110(%rbp)
/*t14 = t14 + 8*/
	movq	-110(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -110(%rbp)
/*t15 = arr[t14]*/
	movq	16(%rbp), %rax
	movq	-110(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -118(%rbp)
/*t18 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -134(%rbp)
/*t18 = t18 + 8*/
	movq	-134(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -134(%rbp)
/*t19 = arr[t18]*/
	movq	16(%rbp), %rax
	movq	-134(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -142(%rbp)
/*t17 = i * 8*/
	movq	-56(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -126(%rbp)
/*t17 = t17 + 8*/
	movq	-126(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -126(%rbp)
/*arr[t17] = t19*/
	movq	16(%rbp), %rcx
	movq	-126(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-142(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t21 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -150(%rbp)
/*t21 = t21 + 8*/
	movq	-150(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -150(%rbp)
/*arr[t21] = t15*/
	movq	16(%rbp), %rcx
	movq	-150(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-118(%rbp), %rbx
	movq	%rbx, (%rcx)
/*goto e0*/
	jmp 	e0
/*e3: skip*/
e3:
/*t24 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -166(%rbp)
/*t24 = t24 + 8*/
	movq	-166(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -166(%rbp)
/*t25 = arr[t24]*/
	movq	16(%rbp), %rax
	movq	-166(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -174(%rbp)
/*t23 = left * 8*/
	movq	24(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -158(%rbp)
/*t23 = t23 + 8*/
	movq	-158(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -158(%rbp)
/*arr[t23] = t25*/
	movq	16(%rbp), %rcx
	movq	-158(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-174(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t27 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -182(%rbp)
/*t27 = t27 + 8*/
	movq	-182(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -182(%rbp)
/*arr[t27] = pivot*/
	movq	16(%rbp), %rcx
	movq	-182(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-32(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t29 = j - 1*/
	movq	-64(%rbp), %rax
	movq	$1, %rbx
	subq	%rbx, %rax
	movq	%rax, -190(%rbp)
/*if left < t29 goto e17*/
	movq	24(%rbp), %rax
	movq	-190(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e17
1:
/*t30 = 0*/
	movb	$0, %al
	movb	%al, -191(%rbp)
/*goto e18*/
	jmp 	e18
/*e17: skip*/
e17:
/*t30 = -1*/
	movb	$-1, %al
	movb	%al, -191(%rbp)
/*e18: skip*/
e18:
/*if t30 = 0 goto e19*/
	movb	-191(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e19
1:
/*t32 = j - 1*/
	movq	-64(%rbp), %rax
	movq	$1, %rbx
	subq	%rbx, %rax
	movq	%rax, -199(%rbp)
/*param t32*/
	movq	-199(%rbp), %rax
	push	%rax
/*param left*/
	movq	24(%rbp), %rax
	push	%rax
/*param arr*/
	movq	16(%rbp), %rax
	push	%rax
/*call s0*/
	call	t_quicksortAux
/*e19: skip*/
e19:
/*t34 = j + 1*/
	movq	-64(%rbp), %rax
	movq	$1, %rbx
	addq	%rbx, %rax
	movq	%rax, -207(%rbp)
/*if t34 < right goto e20*/
	movq	-207(%rbp), %rax
	movq	32(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e20
1:
/*t35 = 0*/
	movb	$0, %al
	movb	%al, -208(%rbp)
/*goto e21*/
	jmp 	e21
/*e20: skip*/
e20:
/*t35 = -1*/
	movb	$-1, %al
	movb	%al, -208(%rbp)
/*e21: skip*/
e21:
/*if t35 = 0 goto e22*/
	movb	-208(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e22
1:
/*t37 = j + 1*/
	movq	-64(%rbp), %rax
	movq	$1, %rbx
	addq	%rbx, %rax
	movq	%rax, -216(%rbp)
/*param right*/
	movq	32(%rbp), %rax
	push	%rax
/*param t37*/
	movq	-216(%rbp), %rax
	push	%rax
/*param arr*/
	movq	16(%rbp), %rax
	push	%rax
/*call s0*/
	call	t_quicksortAux
/*e22: skip*/
e22:
/*rtn s0*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/*t_quicksort: skip*/
t_quicksort:
/*pmb s1*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$24, %rsp
/*t38 = arr[0]*/
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
/*t40 = t38 - 1*/
	movq	-16(%rbp), %rax
	movq	$1, %rbx
	subq	%rbx, %rax
	movq	%rax, -24(%rbp)
/*param t40*/
	movq	-24(%rbp), %rax
	push	%rax
/*param 0*/
	movq	$0, %rax
	push	%rax
/*param arr*/
	movq	16(%rbp), %rax
	push	%rax
/*call s0*/
	call	t_quicksortAux
/*rtn s1*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/*t_printArray: skip*/
t_printArray:
/*pmb s2*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$40, %rsp
/*t42 = 0*/
	movq	$0, %rax
	movq	%rax, -16(%rbp)
/*t44 = arr[0]*/
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
/*el = 0*/
	movq	$0, %rax
	movq	%rax, -40(%rbp)
/*e23: skip*/
e23:
/*if t42 = t44 goto e24*/
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e24
1:
/*t43 = t42 * 8*/
	movq	-16(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -24(%rbp)
/*t43 = t43 + 8*/
	movq	-24(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -24(%rbp)
/*el = arr[t43]*/
	movq	16(%rbp), %rax
	movq	-24(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
/*printInt(el)*/
	movq	-40(%rbp), %rdi
	call	print_uint64
/*t42 = t42 + 1*/
	movq	-16(%rbp), %rax
	movq	$1, %rbx
	addq	%rbx, %rax
	movq	%rax, -16(%rbp)
/*goto e23*/
	jmp 	e23
/*e24: skip*/
e24:
/*rtn s2*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/*t_main: skip*/
t_main:
/*pmb s3*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$16, %rsp
/*t46 = new array[8]*/
	movq	arr_3@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*t46[0] = 8*/
	movq	-16(%rbp), %rcx
	movq	$8, %rbx
	movq	%rbx, (%rcx)
/*t46[8] = 47*/
	movq	-16(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	$47, %rbx
	movq	%rbx, (%rcx)
/*t46[16] = -25*/
	movq	-16(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	$-25, %rbx
	movq	%rbx, (%rcx)
/*t46[24] = 3*/
	movq	-16(%rbp), %rcx
	movq	$24, %rbx
	addq	%rbx, %rcx
	movq	$3, %rbx
	movq	%rbx, (%rcx)
/*t46[32] = 85*/
	movq	-16(%rbp), %rcx
	movq	$32, %rbx
	addq	%rbx, %rcx
	movq	$85, %rbx
	movq	%rbx, (%rcx)
/*t46[40] = 9*/
	movq	-16(%rbp), %rcx
	movq	$40, %rbx
	addq	%rbx, %rcx
	movq	$9, %rbx
	movq	%rbx, (%rcx)
/*t46[48] = 125*/
	movq	-16(%rbp), %rcx
	movq	$48, %rbx
	addq	%rbx, %rcx
	movq	$125, %rbx
	movq	%rbx, (%rcx)
/*t46[56] = 42*/
	movq	-16(%rbp), %rcx
	movq	$56, %rbx
	addq	%rbx, %rcx
	movq	$42, %rbx
	movq	%rbx, (%rcx)
/*t46[64] = 1*/
	movq	-16(%rbp), %rcx
	movq	$64, %rbx
	addq	%rbx, %rcx
	movq	$1, %rbx
	movq	%rbx, (%rcx)
/*values = t46*/
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
/*param values*/
	movq	-8(%rbp), %rax
	push	%rax
/*call s1*/
	call	t_quicksort
/*param values*/
	movq	-8(%rbp), %rax
	push	%rax
/*call s2*/
	call	t_printArray
/*rtn s3*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

print_uint64:
	lea 	-1(%rsp), %rsi
	movb	$'\n', (%rsi)
	mov 	$10, %ecx
	movl	%edi, %ebx
	testl	%edi, %edi
	jns 	.print_uint64_positive
	neg 	%edi

	.print_uint64_positive:
		mov 	%rdi, %rax

	.Ltoascii_digit:
		xor 	%edx, %edx
		div 	%rcx
		add 	$'0', %edx
		dec 	%rsi
		mov 	%dl, (%rsi)
		test	%rax, %rax
		jnz 	.Ltoascii_digit
		testl	%ebx, %ebx
		jns 	.print_uint64_end
		xor 	%edx, %edx
		div 	%rcx
		add 	$'-', %edx
		dec 	%rsi
		mov 	%dl, (%rsi)
		test 	%rax, %rax

	.print_uint64_end:
		mov 	$0x02000004, %eax
		mov 	$1, %edi
		mov 	%rsp, %rdx
		sub 	%rsi, %rdx
		syscall
		ret

.section __DATA, __data
	decl_0: .asciz "true\n"
	decl_1: .asciz "false\n"
	decl_2: .quad 0
	arr_3: .fill 72, 1
