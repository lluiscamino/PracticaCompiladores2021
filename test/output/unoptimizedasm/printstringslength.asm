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
	subq	$64, %rsp
/*t0 = "Hello\n"*/
	movq	str_3@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
/*t1 = stringLength(t0)*/
	movq	-8(%rbp), %rsi
	call	string_length
	subq	$1, %rdx
	movq	%rdx, -16(%rbp)
/*printInt(t1)*/
	movq	-16(%rbp), %rdi
	call	print_uint64
/*t2 = "Hello, world!\n"*/
	movq	str_4@GOTPCREL(%rip), %rax
	movq	%rax, -24(%rbp)
/*t3 = stringLength(t2)*/
	movq	-24(%rbp), %rsi
	call	string_length
	subq	$1, %rdx
	movq	%rdx, -32(%rbp)
/*printInt(t3)*/
	movq	-32(%rbp), %rdi
	call	print_uint64
/*t4 = "\n"*/
	movq	str_5@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)
/*t5 = stringLength(t4)*/
	movq	-40(%rbp), %rsi
	call	string_length
	subq	$1, %rdx
	movq	%rdx, -48(%rbp)
/*printInt(t5)*/
	movq	-48(%rbp), %rdi
	call	print_uint64
/*t6 = "-1\n"*/
	movq	str_6@GOTPCREL(%rip), %rax
	movq	%rax, -56(%rbp)
/*t7 = stringLength(t6)*/
	movq	-56(%rbp), %rsi
	call	string_length
	subq	$1, %rdx
	movq	%rdx, -64(%rbp)
/*printInt(t7)*/
	movq	-64(%rbp), %rdi
	call	print_uint64
/*rtn s0*/
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
	str_3: .asciz "Hello\n"
	str_4: .asciz "Hello, world!\n"
	str_5: .asciz "\n"
	str_6: .asciz "-1\n"
