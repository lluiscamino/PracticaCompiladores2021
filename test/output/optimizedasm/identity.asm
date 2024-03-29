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
/*t_identity: skip*/
t_identity:
/*pmb s0*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$0, %rsp
/*rtn s0: x*/
	movq	16(%rbp), %rax
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/*t_main: skip*/
t_main:
/*pmb s1*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$32, %rsp
/*param -7*/
	movq	$-7, %rax
	push	%rax
/*t0 = call s0*/
	call	t_identity
	movq	%rax, -8(%rbp)
/*printInt(t0)*/
	movq	-8(%rbp), %rdi
	call	print_uint64
/*param 3*/
	movq	$3, %rax
	push	%rax
/*t3 = call s0*/
	call	t_identity
	movq	%rax, -16(%rbp)
/*printInt(t3)*/
	movq	-16(%rbp), %rdi
	call	print_uint64
/*param 11*/
	movq	$11, %rax
	push	%rax
/*t5 = call s0*/
	call	t_identity
	movq	%rax, -24(%rbp)
/*printInt(t5)*/
	movq	-24(%rbp), %rdi
	call	print_uint64
/*goto e3*/
	jmp 	e3
/*e3: skip*/
e3:
/*param 3*/
	movq	$3, %rax
	push	%rax
/*t9 = call s0*/
	call	t_identity
	movq	%rax, -32(%rbp)
/*printInt(t9)*/
	movq	-32(%rbp), %rdi
	call	print_uint64
/*rtn s1*/
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
