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
/*t_twoSum: skip*/
t_twoSum:
/*pmb s0*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$186, %rsp
/*t0 = new array[2]*/
	movq	arr_3@GOTPCREL(%rip), %rax
	movq	%rax, -32(%rbp)
/*t0[0] = 2*/
	movq	-32(%rbp), %rcx
	movq	$2, %rbx
	movq	%rbx, (%rcx)
/*t1 = 1*/
	movq	$1, %rax
	movq	%rax, -40(%rbp)
/*t2 = - t1*/
	xorq 	%rax, %rax
	movq	-40(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -48(%rbp)
/*t0[8] = t2*/
	movq	-32(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	-48(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t3 = 1*/
	movq	$1, %rax
	movq	%rax, -56(%rbp)
/*t4 = - t3*/
	xorq 	%rax, %rax
	movq	-56(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -64(%rbp)
/*t0[16] = t4*/
	movq	-32(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	-64(%rbp), %rbx
	movq	%rbx, (%rcx)
/*result = t0*/
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
/*t5 = 0*/
	movq	$0, %rax
	movq	%rax, -80(%rbp)
/*i = t5*/
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
/*t6 = 0*/
	movb	$0, %al
	movb	%al, -82(%rbp)
/*res = t6*/
	movb	-82(%rbp), %al
	movb	%al, -81(%rbp)
/*e0: skip*/
e0:
/*t7 = nums[0]*/
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -90(%rbp)
/*if i < t7 goto e1*/
	movq	-72(%rbp), %rax
	movq	-90(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e1
1:
/*t8 = 0*/
	movb	$0, %al
	movb	%al, -91(%rbp)
/*goto e2*/
	jmp 	e2
/*e1: skip*/
e1:
/*t8 = -1*/
	movb	$-1, %al
	movb	%al, -91(%rbp)
/*e2: skip*/
e2:
/*t9 = not res*/
	movb	-81(%rbp), %bl
	notb	%bl
	movb	%bl, -92(%rbp)
/*t10 = t8 and t9*/
	movb	-91(%rbp), %al
	movb	-92(%rbp), %bl
	andb	%bl, %al
	movb	%al, -93(%rbp)
/*if t10 = 0 goto e3*/
	movb	-93(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e3
1:
/*t11 = 0*/
	movq	$0, %rax
	movq	%rax, -109(%rbp)
/*j = t11*/
	movq	-109(%rbp), %rax
	movq	%rax, -101(%rbp)
/*e4: skip*/
e4:
/*t12 = nums[0]*/
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -117(%rbp)
/*if j < t12 goto e5*/
	movq	-101(%rbp), %rax
	movq	-117(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e5
1:
/*t13 = 0*/
	movb	$0, %al
	movb	%al, -118(%rbp)
/*goto e6*/
	jmp 	e6
/*e5: skip*/
e5:
/*t13 = -1*/
	movb	$-1, %al
	movb	%al, -118(%rbp)
/*e6: skip*/
e6:
/*t14 = not res*/
	movb	-81(%rbp), %bl
	notb	%bl
	movb	%bl, -119(%rbp)
/*t15 = t13 and t14*/
	movb	-118(%rbp), %al
	movb	-119(%rbp), %bl
	andb	%bl, %al
	movb	%al, -120(%rbp)
/*if t15 = 0 goto e7*/
	movb	-120(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e7
1:
/*t16 = i * 8*/
	movq	-72(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -128(%rbp)
/*t16 = t16 + 8*/
	movq	-128(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -128(%rbp)
/*t17 = nums[t16]*/
	movq	16(%rbp), %rax
	movq	-128(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
/*t18 = j * 8*/
	movq	-101(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -144(%rbp)
/*t18 = t18 + 8*/
	movq	-144(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -144(%rbp)
/*t19 = nums[t18]*/
	movq	16(%rbp), %rax
	movq	-144(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -152(%rbp)
/*t20 = target - t19*/
	movq	24(%rbp), %rax
	movq	-152(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -160(%rbp)
/*if t17 = t20 goto e8*/
	movq	-136(%rbp), %rax
	movq	-160(%rbp), %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e8
1:
/*t21 = 0*/
	movb	$0, %al
	movb	%al, -161(%rbp)
/*goto e9*/
	jmp 	e9
/*e8: skip*/
e8:
/*t21 = -1*/
	movb	$-1, %al
	movb	%al, -161(%rbp)
/*e9: skip*/
e9:
/*if t21 = 0 goto e10*/
	movb	-161(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e10
1:
/*t22 = new array[2]*/
	movq	arr_4@GOTPCREL(%rip), %rax
	movq	%rax, -169(%rbp)
/*t22[0] = 2*/
	movq	-169(%rbp), %rcx
	movq	$2, %rbx
	movq	%rbx, (%rcx)
/*t22[8] = i*/
	movq	-169(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	-72(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t22[16] = j*/
	movq	-169(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	-101(%rbp), %rbx
	movq	%rbx, (%rcx)
/*result = t22*/
	movq	-169(%rbp), %rax
	movq	%rax, -24(%rbp)
/*t23 = -1*/
	movb	$-1, %al
	movb	%al, -170(%rbp)
/*res = t23*/
	movb	-170(%rbp), %al
	movb	%al, -81(%rbp)
/*e10: skip*/
e10:
/*t24 = 1*/
	movq	$1, %rax
	movq	%rax, -178(%rbp)
/*j = j + t24*/
	movq	-101(%rbp), %rax
	movq	-178(%rbp), %rbx
	addq	%rbx, %rax
	movq	%rax, -101(%rbp)
/*goto e4*/
	jmp 	e4
/*e7: skip*/
e7:
/*t25 = 1*/
	movq	$1, %rax
	movq	%rax, -186(%rbp)
/*i = i + t25*/
	movq	-72(%rbp), %rax
	movq	-186(%rbp), %rbx
	addq	%rbx, %rax
	movq	%rax, -72(%rbp)
/*goto e0*/
	jmp 	e0
/*e3: skip*/
e3:
/*rtn s0: result*/
	movq	-24(%rbp), %rax
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/*t_main: skip*/
t_main:
/*pmb s1*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$315, %rsp
/*t27 = 11*/
	movq	$11, %rax
	movq	%rax, -24(%rbp)
/*t28 = new array[17]*/
	movq	arr_5@GOTPCREL(%rip), %rax
	movq	%rax, -32(%rbp)
/*t28[0] = 17*/
	movq	-32(%rbp), %rcx
	movq	$17, %rbx
	movq	%rbx, (%rcx)
/*t29 = 6*/
	movq	$6, %rax
	movq	%rax, -40(%rbp)
/*t28[8] = t29*/
	movq	-32(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	-40(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t30 = 4*/
	movq	$4, %rax
	movq	%rax, -48(%rbp)
/*t28[16] = t30*/
	movq	-32(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	-48(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t31 = 3*/
	movq	$3, %rax
	movq	%rax, -56(%rbp)
/*t28[24] = t31*/
	movq	-32(%rbp), %rcx
	movq	$24, %rbx
	addq	%rbx, %rcx
	movq	-56(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t32 = 9*/
	movq	$9, %rax
	movq	%rax, -64(%rbp)
/*t28[32] = t32*/
	movq	-32(%rbp), %rcx
	movq	$32, %rbx
	addq	%rbx, %rcx
	movq	-64(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t33 = 5*/
	movq	$5, %rax
	movq	%rax, -72(%rbp)
/*t28[40] = t33*/
	movq	-32(%rbp), %rcx
	movq	$40, %rbx
	addq	%rbx, %rcx
	movq	-72(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t34 = 3*/
	movq	$3, %rax
	movq	%rax, -80(%rbp)
/*t28[48] = t34*/
	movq	-32(%rbp), %rcx
	movq	$48, %rbx
	addq	%rbx, %rcx
	movq	-80(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t35 = 1*/
	movq	$1, %rax
	movq	%rax, -88(%rbp)
/*t28[56] = t35*/
	movq	-32(%rbp), %rcx
	movq	$56, %rbx
	addq	%rbx, %rcx
	movq	-88(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t36 = 1*/
	movq	$1, %rax
	movq	%rax, -96(%rbp)
/*t28[64] = t36*/
	movq	-32(%rbp), %rcx
	movq	$64, %rbx
	addq	%rbx, %rcx
	movq	-96(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t37 = 5*/
	movq	$5, %rax
	movq	%rax, -104(%rbp)
/*t28[72] = t37*/
	movq	-32(%rbp), %rcx
	movq	$72, %rbx
	addq	%rbx, %rcx
	movq	-104(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t38 = 5*/
	movq	$5, %rax
	movq	%rax, -112(%rbp)
/*t28[80] = t38*/
	movq	-32(%rbp), %rcx
	movq	$80, %rbx
	addq	%rbx, %rcx
	movq	-112(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t39 = 1*/
	movq	$1, %rax
	movq	%rax, -120(%rbp)
/*t28[88] = t39*/
	movq	-32(%rbp), %rcx
	movq	$88, %rbx
	addq	%rbx, %rcx
	movq	-120(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t40 = 9*/
	movq	$9, %rax
	movq	%rax, -128(%rbp)
/*t28[96] = t40*/
	movq	-32(%rbp), %rcx
	movq	$96, %rbx
	addq	%rbx, %rcx
	movq	-128(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t41 = 5*/
	movq	$5, %rax
	movq	%rax, -136(%rbp)
/*t28[104] = t41*/
	movq	-32(%rbp), %rcx
	movq	$104, %rbx
	addq	%rbx, %rcx
	movq	-136(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t42 = 7*/
	movq	$7, %rax
	movq	%rax, -144(%rbp)
/*t28[112] = t42*/
	movq	-32(%rbp), %rcx
	movq	$112, %rbx
	addq	%rbx, %rcx
	movq	-144(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t43 = 1*/
	movq	$1, %rax
	movq	%rax, -152(%rbp)
/*t28[120] = t43*/
	movq	-32(%rbp), %rcx
	movq	$120, %rbx
	addq	%rbx, %rcx
	movq	-152(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t44 = 2*/
	movq	$2, %rax
	movq	%rax, -160(%rbp)
/*t28[128] = t44*/
	movq	-32(%rbp), %rcx
	movq	$128, %rbx
	addq	%rbx, %rcx
	movq	-160(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t45 = 4*/
	movq	$4, %rax
	movq	%rax, -168(%rbp)
/*t28[136] = t45*/
	movq	-32(%rbp), %rcx
	movq	$136, %rbx
	addq	%rbx, %rcx
	movq	-168(%rbp), %rbx
	movq	%rbx, (%rcx)
/*param t27*/
	movq	-24(%rbp), %rax
	push	%rax
/*param t28*/
	movq	-32(%rbp), %rax
	push	%rax
/*t26 = call s0*/
	call	t_twoSum
	movq	%rax, -16(%rbp)
/*result = t26*/
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
/*t46 = 0*/
	movq	$0, %rax
	movq	%rax, -176(%rbp)
/*t47 = t46 * 8*/
	movq	-176(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -184(%rbp)
/*t47 = t47 + 8*/
	movq	-184(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -184(%rbp)
/*t48 = result[t47]*/
	movq	-8(%rbp), %rax
	movq	-184(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
/*t49 = 1*/
	movq	$1, %rax
	movq	%rax, -200(%rbp)
/*t50 = - t49*/
	xorq 	%rax, %rax
	movq	-200(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -208(%rbp)
/*if t48 != t50 goto e11*/
	movq	-192(%rbp), %rax
	movq	-208(%rbp), %rbx
	cmpq	%rbx, %rax
	je 	1f
	jmp	e11
1:
/*t51 = 0*/
	movb	$0, %al
	movb	%al, -209(%rbp)
/*goto e12*/
	jmp 	e12
/*e11: skip*/
e11:
/*t51 = -1*/
	movb	$-1, %al
	movb	%al, -209(%rbp)
/*e12: skip*/
e12:
/*t52 = 1*/
	movq	$1, %rax
	movq	%rax, -217(%rbp)
/*t53 = t52 * 8*/
	movq	-217(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -225(%rbp)
/*t53 = t53 + 8*/
	movq	-225(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -225(%rbp)
/*t54 = result[t53]*/
	movq	-8(%rbp), %rax
	movq	-225(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -233(%rbp)
/*t55 = 1*/
	movq	$1, %rax
	movq	%rax, -241(%rbp)
/*t56 = - t55*/
	xorq 	%rax, %rax
	movq	-241(%rbp), %rbx
	subq	%rbx, %rax
	movq	%rax, -249(%rbp)
/*if t54 != t56 goto e13*/
	movq	-233(%rbp), %rax
	movq	-249(%rbp), %rbx
	cmpq	%rbx, %rax
	je 	1f
	jmp	e13
1:
/*t57 = 0*/
	movb	$0, %al
	movb	%al, -250(%rbp)
/*goto e14*/
	jmp 	e14
/*e13: skip*/
e13:
/*t57 = -1*/
	movb	$-1, %al
	movb	%al, -250(%rbp)
/*e14: skip*/
e14:
/*t58 = t51 or t57*/
	movb	-209(%rbp), %al
	movb	-250(%rbp), %bl
	orb 	%bl, %al
	movb	%al, -251(%rbp)
/*if t58 = 0 goto e15*/
	movb	-251(%rbp), %al
	movb	$0, %bl
	cmpb	%bl, %al
	jne 	1f
	jmp	e15
1:
/*t59 = "Resultado: \n"*/
	movq	str_6@GOTPCREL(%rip), %rax
	movq	%rax, -259(%rbp)
/*printString(t59)*/
	movq	-259(%rbp), %rsi
	call	print_string
/*t60 = 0*/
	movq	$0, %rax
	movq	%rax, -267(%rbp)
/*t61 = t60 * 8*/
	movq	-267(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -275(%rbp)
/*t61 = t61 + 8*/
	movq	-275(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -275(%rbp)
/*t62 = result[t61]*/
	movq	-8(%rbp), %rax
	movq	-275(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -283(%rbp)
/*printInt(t62)*/
	movq	-283(%rbp), %rdi
	call	print_uint64
/*t63 = 1*/
	movq	$1, %rax
	movq	%rax, -291(%rbp)
/*t64 = t63 * 8*/
	movq	-291(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -299(%rbp)
/*t64 = t64 + 8*/
	movq	-299(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -299(%rbp)
/*t65 = result[t64]*/
	movq	-8(%rbp), %rax
	movq	-299(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -307(%rbp)
/*printInt(t65)*/
	movq	-307(%rbp), %rdi
	call	print_uint64
/*goto e16*/
	jmp 	e16
/*e15: skip*/
e15:
/*t66 = "Sin resultado\n"*/
	movq	str_7@GOTPCREL(%rip), %rax
	movq	%rax, -315(%rbp)
/*printString(t66)*/
	movq	-315(%rbp), %rsi
	call	print_string
/*e16: skip*/
e16:
/*rtn s1*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/**
 * Returns a string's length (saves to %rdx)
 * Params:
 * - %rsi: String address
 * https://stackoverflow.com/questions/60482733/how-to-traverse-a-string-in-assembly-until-i-reach-null-strlen-loop
 */
string_length:
	lea 	-1(%rsi), %rdx
	.Lloop:
		inc 	%rdx
		cmpb	$0, (%rdx)
		jne 	.Lloop
	sub 	%rsi, %rdx
	ret

/**
 * Prints a string to stdout
 * Params:
 * - %rsi: String address
 */
print_string:
	call	string_length
	mov 	$0x02000004, %rax
	mov 	$1, %rdi
	syscall
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
	arr_3: .fill 24, 1
	arr_4: .fill 24, 1
	arr_5: .fill 144, 1
	str_6: .asciz "Resultado: \n"
	str_7: .asciz "Sin resultado\n"
