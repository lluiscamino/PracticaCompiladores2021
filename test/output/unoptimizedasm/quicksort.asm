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
	subq	$360, %rsp
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
	movq	$0, %rax
	movq	%rax, -72(%rbp)
/*goto e2*/
	jmp 	e2
/*e1: skip*/
e1:
/*t2 = -1*/
	movq	$-1, %rax
	movq	%rax, -72(%rbp)
/*e2: skip*/
e2:
/*if t2 = 0 goto e3*/
	movq	-72(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e3
1:
/*e4: skip*/
e4:
/*t3 = i * 8*/
	movq	-56(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -80(%rbp)
/*t3 = t3 + 8*/
	movq	-80(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -80(%rbp)
/*t4 = arr[t3]*/
	movq	16(%rbp), %rax
	movq	-80(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
/*if t4 <= pivot goto e5*/
	movq	-88(%rbp), %rax
	movq	-32(%rbp), %rbx
	cmpq	%rbx, %rax
	ja 	1f
	jmp	e5
1:
/*t5 = 0*/
	movq	$0, %rax
	movq	%rax, -96(%rbp)
/*goto e6*/
	jmp 	e6
/*e5: skip*/
e5:
/*t5 = -1*/
	movq	$-1, %rax
	movq	%rax, -96(%rbp)
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
	movq	$0, %rax
	movq	%rax, -104(%rbp)
/*goto e8*/
	jmp 	e8
/*e7: skip*/
e7:
/*t6 = -1*/
	movq	$-1, %rax
	movq	%rax, -104(%rbp)
/*e8: skip*/
e8:
/*t7 = t5 and t6*/
	movq	-96(%rbp), %rax
	movq	-104(%rbp), %rbx
	andq	%rbx, %rax
	movq	%rax, -112(%rbp)
/*if t7 = 0 goto e9*/
	movq	-112(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e9
1:
/*t8 = 1*/
	movq	$1, %rax
	movq	%rax, -120(%rbp)
/*i = i + t8*/
	movq	-56(%rbp), %rax
	movq	-120(%rbp), %rbx
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
	movq	%rax, -128(%rbp)
/*t9 = t9 + 8*/
	movq	-128(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -128(%rbp)
/*t10 = arr[t9]*/
	movq	16(%rbp), %rax
	movq	-128(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
/*if t10 > pivot goto e11*/
	movq	-136(%rbp), %rax
	movq	-32(%rbp), %rbx
	cmpq	%rbx, %rax
	jle 	1f
	jmp	e11
1:
/*t11 = 0*/
	movq	$0, %rax
	movq	%rax, -144(%rbp)
/*goto e12*/
	jmp 	e12
/*e11: skip*/
e11:
/*t11 = -1*/
	movq	$-1, %rax
	movq	%rax, -144(%rbp)
/*e12: skip*/
e12:
/*if t11 = 0 goto e13*/
	movq	-144(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e13
1:
/*t12 = 1*/
	movq	$1, %rax
	movq	%rax, -152(%rbp)
/*j = j - t12*/
	movq	-64(%rbp), %rax
	movq	-152(%rbp), %rbx
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
	movq	$0, %rax
	movq	%rax, -160(%rbp)
/*goto e15*/
	jmp 	e15
/*e14: skip*/
e14:
/*t13 = -1*/
	movq	$-1, %rax
	movq	%rax, -160(%rbp)
/*e15: skip*/
e15:
/*if t13 = 0 goto e16*/
	movq	-160(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e16
1:
/*t14 = i * 8*/
	movq	-56(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -176(%rbp)
/*t14 = t14 + 8*/
	movq	-176(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -176(%rbp)
/*t15 = arr[t14]*/
	movq	16(%rbp), %rax
	movq	-176(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -184(%rbp)
/*aux = t15*/
	movq	-184(%rbp), %rax
	movq	%rax, -168(%rbp)
/*t16 = arr*/
	movq	16(%rbp), %rax
	movq	%rax, -192(%rbp)
/*t18 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -208(%rbp)
/*t18 = t18 + 8*/
	movq	-208(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -208(%rbp)
/*t19 = arr[t18]*/
	movq	16(%rbp), %rax
	movq	-208(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
/*t17 = i * 8*/
	movq	-56(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -200(%rbp)
/*t17 = t17 + 8*/
	movq	-200(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -200(%rbp)
/*t16[t17] = t19*/
	movq	-192(%rbp), %rcx
	movq	-200(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-216(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t20 = arr*/
	movq	16(%rbp), %rax
	movq	%rax, -224(%rbp)
/*t21 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -232(%rbp)
/*t21 = t21 + 8*/
	movq	-232(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -232(%rbp)
/*t20[t21] = aux*/
	movq	-224(%rbp), %rcx
	movq	-232(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-168(%rbp), %rbx
	movq	%rbx, (%rcx)
/*e16: skip*/
e16:
/*goto e0*/
	jmp 	e0
/*e3: skip*/
e3:
/*t22 = arr*/
	movq	16(%rbp), %rax
	movq	%rax, -240(%rbp)
/*t24 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -256(%rbp)
/*t24 = t24 + 8*/
	movq	-256(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -256(%rbp)
/*t25 = arr[t24]*/
	movq	16(%rbp), %rax
	movq	-256(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -264(%rbp)
/*t23 = left * 8*/
	movq	24(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -248(%rbp)
/*t23 = t23 + 8*/
	movq	-248(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -248(%rbp)
/*t22[t23] = t25*/
	movq	-240(%rbp), %rcx
	movq	-248(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-264(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t26 = arr*/
	movq	16(%rbp), %rax
	movq	%rax, -272(%rbp)
/*t27 = j * 8*/
	movq	-64(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -280(%rbp)
/*t27 = t27 + 8*/
	movq	-280(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -280(%rbp)
/*t26[t27] = pivot*/
	movq	-272(%rbp), %rcx
	movq	-280(%rbp), %rbx
	addq	%rbx, %rcx
	movq	-32(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t28 = 1*/
	movq	$1, %rax
	movq	%rax, -288(%rbp)
/*t29 = j - t28*/
	movq	-64(%rbp), %rax
	movq	-288(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -296(%rbp)
/*if left < t29 goto e17*/
	movq	24(%rbp), %rax
	movq	-296(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e17
1:
/*t30 = 0*/
	movq	$0, %rax
	movq	%rax, -304(%rbp)
/*goto e18*/
	jmp 	e18
/*e17: skip*/
e17:
/*t30 = -1*/
	movq	$-1, %rax
	movq	%rax, -304(%rbp)
/*e18: skip*/
e18:
/*if t30 = 0 goto e19*/
	movq	-304(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e19
1:
/*t31 = 1*/
	movq	$1, %rax
	movq	%rax, -312(%rbp)
/*t32 = j - t31*/
	movq	-64(%rbp), %rax
	movq	-312(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -320(%rbp)
/*param t32*/
	movq	-320(%rbp), %rax
	pushq	%rax
/*param left*/
	movq	24(%rbp), %rax
	pushq	%rax
/*param arr*/
	movq	16(%rbp), %rax
	pushq	%rax
/*call s0*/
	call	t_quicksortAux
/*e19: skip*/
e19:
/*t33 = 1*/
	movq	$1, %rax
	movq	%rax, -328(%rbp)
/*t34 = j + t33*/
	movq	-64(%rbp), %rax
	movq	-328(%rbp), %rbx
	addq	%rbx, %rax
	movq	%rax, -336(%rbp)
/*if t34 < right goto e20*/
	movq	-336(%rbp), %rax
	movq	32(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e20
1:
/*t35 = 0*/
	movq	$0, %rax
	movq	%rax, -344(%rbp)
/*goto e21*/
	jmp 	e21
/*e20: skip*/
e20:
/*t35 = -1*/
	movq	$-1, %rax
	movq	%rax, -344(%rbp)
/*e21: skip*/
e21:
/*if t35 = 0 goto e22*/
	movq	-344(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e22
1:
/*t36 = 1*/
	movq	$1, %rax
	movq	%rax, -352(%rbp)
/*t37 = j + t36*/
	movq	-64(%rbp), %rax
	movq	-352(%rbp), %rbx
	addq	%rbx, %rax
	movq	%rax, -360(%rbp)
/*param right*/
	movq	32(%rbp), %rax
	pushq	%rax
/*param t37*/
	movq	-360(%rbp), %rax
	pushq	%rax
/*param arr*/
	movq	16(%rbp), %rax
	pushq	%rax
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
	subq	$40, %rsp
/*t38 = arr[0]*/
	movq	16(%rbp), %rax
	movq	$0, %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
/*t39 = 1*/
	movq	$1, %rax
	movq	%rax, -24(%rbp)
/*t40 = t38 - t39*/
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -32(%rbp)
/*t41 = 0*/
	movq	$0, %rax
	movq	%rax, -40(%rbp)
/*param t40*/
	movq	-32(%rbp), %rax
	pushq	%rax
/*param t41*/
	movq	-40(%rbp), %rax
	pushq	%rax
/*param arr*/
	movq	16(%rbp), %rax
	pushq	%rax
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
	subq	$48, %rsp
/*t42 = 0*/
	movq	$0, %rax
	movq	%rax, -16(%rbp)
/*t44 = arr[0]*/
	movq	16(%rbp), %rax
	movq	$0, %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
/*t45 = 0*/
	movq	$0, %rax
	movq	%rax, -48(%rbp)
/*el = t45*/
	movq	-48(%rbp), %rax
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
	subq	$88, %rsp
/*t46 = new array[8]*/
	movq	arr_3@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*t46[0] = 8*/
	movq	-16(%rbp), %rcx
	movq	$0, %rbx
	addq	%rbx, %rcx
	movq	$8, %rbx
	movq	%rbx, (%rcx)
/*t47 = 47*/
	movq	$47, %rax
	movq	%rax, -24(%rbp)
/*t46[8] = t47*/
	movq	-16(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	-24(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t48 = 25*/
	movq	$25, %rax
	movq	%rax, -32(%rbp)
/*t49 = - t48*/
	xorq 	%rax, %rax
	movq	-32(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -40(%rbp)
/*t46[16] = t49*/
	movq	-16(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	-40(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t50 = 3*/
	movq	$3, %rax
	movq	%rax, -48(%rbp)
/*t46[24] = t50*/
	movq	-16(%rbp), %rcx
	movq	$24, %rbx
	addq	%rbx, %rcx
	movq	-48(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t51 = 85*/
	movq	$85, %rax
	movq	%rax, -56(%rbp)
/*t46[32] = t51*/
	movq	-16(%rbp), %rcx
	movq	$32, %rbx
	addq	%rbx, %rcx
	movq	-56(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t52 = 9*/
	movq	$9, %rax
	movq	%rax, -64(%rbp)
/*t46[40] = t52*/
	movq	-16(%rbp), %rcx
	movq	$40, %rbx
	addq	%rbx, %rcx
	movq	-64(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t53 = 125*/
	movq	$125, %rax
	movq	%rax, -72(%rbp)
/*t46[48] = t53*/
	movq	-16(%rbp), %rcx
	movq	$48, %rbx
	addq	%rbx, %rcx
	movq	-72(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t54 = 42*/
	movq	$42, %rax
	movq	%rax, -80(%rbp)
/*t46[56] = t54*/
	movq	-16(%rbp), %rcx
	movq	$56, %rbx
	addq	%rbx, %rcx
	movq	-80(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t55 = 1*/
	movq	$1, %rax
	movq	%rax, -88(%rbp)
/*t46[64] = t55*/
	movq	-16(%rbp), %rcx
	movq	$64, %rbx
	addq	%rbx, %rcx
	movq	-88(%rbp), %rbx
	movq	%rbx, (%rcx)
/*values = t46*/
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
/*param values*/
	movq	-8(%rbp), %rax
	pushq	%rax
/*call s1*/
	call	t_quicksort
/*param values*/
	movq	-8(%rbp), %rax
	pushq	%rax
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
