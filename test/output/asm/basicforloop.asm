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
/*t_main: skip*/
t_main:
/*pmb s0*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$88, %rsp
/*t0 = new array[5]*/
	movq	arr_3@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*t0[0] = 4*/
	movq	-16(%rbp), %rcx
	movq	$0, %rbx
	addq	%rbx, %rcx
	movq	$4, %rbx
	movq	%rbx, (%rcx)
/*t3 = 65*/
	movq	$65, %rax
	movq	%rax, -24(%rbp)
/*t0[8] = t3*/
	movq	-16(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	-24(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t6 = 93*/
	movq	$93, %rax
	movq	%rax, -32(%rbp)
/*t0[16] = t6*/
	movq	-16(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	-32(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t9 = 28*/
	movq	$28, %rax
	movq	%rax, -40(%rbp)
/*t0[24] = t9*/
	movq	-16(%rbp), %rcx
	movq	$24, %rbx
	addq	%rbx, %rcx
	movq	-40(%rbp), %rbx
	movq	%rbx, (%rcx)
/*t12 = 92*/
	movq	$92, %rax
	movq	%rax, -48(%rbp)
/*t0[32] = t12*/
	movq	-16(%rbp), %rcx
	movq	$32, %rbx
	addq	%rbx, %rcx
	movq	-48(%rbp), %rbx
	movq	%rbx, (%rcx)
/*arr = t0*/
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
/*i = 0*/
	movq	$0, %rax
	movq	%rax, -56(%rbp)
/*e0: skip*/
e0:
/*t14 = arr[0]*/
	movq	-8(%rbp), %rax
	movq	$0, %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
/*if i < t14 goto e1*/
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rbx
	cmpq	%rbx, %rax
	jge 	1f
	jmp	e1
1:
/*t15 = 0*/
	movq	$0, %rax
	movq	%rax, -72(%rbp)
/*goto e2*/
	jmp 	e2
/*e1: skip*/
e1:
/*t15 = -1*/
	movq	$-1, %rax
	movq	%rax, -72(%rbp)
/*e2: skip*/
e2:
/*if t15 = 0 goto e3*/
	movq	-72(%rbp), %rax
	movq	$0, %rbx
	cmpq	%rbx, %rax
	jne 	1f
	jmp	e3
1:
/*t16 = i + 1*/
	movq	-56(%rbp), %rax
	movq	$1, %rbx
	addq	%rbx, %rax
	movq	%rax, -80(%rbp)
/*t16 = t16 * 8*/
	movq	-80(%rbp), %rax
	movq	$8, %rbx
	imulq	%rbx, %rax
	movq	%rax, -80(%rbp)
/*t17 = arr[t16]*/
	movq	-8(%rbp), %rax
	movq	-80(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
/*printInt(t17)*/
	movq	-88(%rbp), %rdi
	call	print_uint64
/*i = i + 1*/
	movq	-56(%rbp), %rax
	movq	$1, %rbx
	addq	%rbx, %rax
	movq	%rax, -56(%rbp)
/*goto e0*/
	jmp 	e0
/*e3: skip*/
e3:
/*rtn s0*/
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
	arr_3: .fill 5, 8