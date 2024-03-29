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
	subq	$65, %rsp
/*t0 = new array[4]*/
	movq	arr_3@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
/*t0[0] = 4*/
	movq	-8(%rbp), %rcx
	movq	$4, %rbx
	movq	%rbx, (%rcx)
/*t0[8] = 3*/
	movq	-8(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	$3, %rbx
	movq	%rbx, (%rcx)
/*t0[16] = 8*/
	movq	-8(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	$8, %rbx
	movq	%rbx, (%rcx)
/*t0[24] = 24*/
	movq	-8(%rbp), %rcx
	movq	$24, %rbx
	addq	%rbx, %rcx
	movq	$24, %rbx
	movq	%rbx, (%rcx)
/*t0[32] = 9*/
	movq	-8(%rbp), %rcx
	movq	$32, %rbx
	addq	%rbx, %rcx
	movq	$9, %rbx
	movq	%rbx, (%rcx)
/*t5 = new array[4]*/
	movq	arr_4@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*t5[0] = 4*/
	movq	-16(%rbp), %rcx
	movq	$4, %rbx
	movq	%rbx, (%rcx)
/*t5[8] = -1*/
	movq	-16(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movb	$-1, %bl
	movb	%bl, (%rcx)
/*t5[9] = 0*/
	movq	-16(%rbp), %rcx
	movq	$9, %rbx
	addq	%rbx, %rcx
	movb	$0, %bl
	movb	%bl, (%rcx)
/*t5[10] = 0*/
	movq	-16(%rbp), %rcx
	movq	$10, %rbx
	addq	%rbx, %rcx
	movb	$0, %bl
	movb	%bl, (%rcx)
/*t5[11] = -1*/
	movq	-16(%rbp), %rcx
	movq	$11, %rbx
	addq	%rbx, %rcx
	movb	$-1, %bl
	movb	%bl, (%rcx)
/*t12 = new array[4]*/
	movq	arr_5@GOTPCREL(%rip), %rax
	movq	%rax, -24(%rbp)
/*t12[0] = 4*/
	movq	-24(%rbp), %rcx
	movq	$4, %rbx
	movq	%rbx, (%rcx)
/*t12[8] = "Juan\n"*/
	movq	-24(%rbp), %rcx
	movq	$8, %rbx
	addq	%rbx, %rcx
	movq	str_6@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rcx)
/*t12[16] = "Pedro\n"*/
	movq	-24(%rbp), %rcx
	movq	$16, %rbx
	addq	%rbx, %rcx
	movq	str_7@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rcx)
/*t12[24] = "Sara\n"*/
	movq	-24(%rbp), %rcx
	movq	$24, %rbx
	addq	%rbx, %rcx
	movq	str_8@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rcx)
/*t12[32] = "Antonio\n"*/
	movq	-24(%rbp), %rcx
	movq	$32, %rbx
	addq	%rbx, %rcx
	movq	str_9@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rcx)
/*t18 = 16*/
	movq	$16, %rax
	movq	%rax, -32(%rbp)
/*t18 = t18 + 8*/
	movq	-32(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -32(%rbp)
/*t19 = t0[t18]*/
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
/*printInt(t19)*/
	movq	-40(%rbp), %rdi
	call	print_uint64
/*t21 = 2*/
	movq	$2, %rax
	movq	%rax, -48(%rbp)
/*t21 = t21 + 8*/
	movq	-48(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -48(%rbp)
/*t22 = t5[t21]*/
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rbx
	addq	%rbx, %rax
	movb	(%rax), %al
	movb	%al, -49(%rbp)
/*printBoolean(t22)*/
	movb	-49(%rbp), %bl
	call	print_boolean
/*t24 = 16*/
	movq	$16, %rax
	movq	%rax, -57(%rbp)
/*t24 = t24 + 8*/
	movq	-57(%rbp), %rax
	movq	$8, %rbx
	addq	%rbx, %rax
	movq	%rax, -57(%rbp)
/*t25 = t12[t24]*/
	movq	-24(%rbp), %rax
	movq	-57(%rbp), %rbx
	addq	%rbx, %rax
	movq	(%rax), %rax
	movq	%rax, -65(%rbp)
/*printString(t25)*/
	movq	-65(%rbp), %rsi
	call	print_string
/*rtn s0*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/**
 * Prints a boolean to stdout
 * Params:
 * - %bl: Boolean value
 */
print_boolean:
	testb	%bl, %bl
	jnz 	.print_boolean_true
	movq	decl_1@GOTPCREL(%rip), %rsi
	jmp 	.print_boolean_end
	.print_boolean_true:
		movq	decl_0@GOTPCREL(%rip), %rsi
	.print_boolean_end:
		call 	print_string
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
	arr_3: .fill 40, 1
	arr_4: .fill 12, 1
	arr_5: .fill 40, 1
	str_6: .asciz "Juan\n"
	str_7: .asciz "Pedro\n"
	str_8: .asciz "Sara\n"
	str_9: .asciz "Antonio\n"
