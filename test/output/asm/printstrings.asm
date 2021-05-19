.section	__TEXT, __text
	.globl	_main
	.globl	print_uint64
	.globl	print_boolean
	.globl	print_string
	.globl	string_length
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

/**
 * Prints a boolean to stdout
 * Params:
 * - %rbx: Boolean value
 */
print_boolean:
	testl	%ebx, %ebx
	jnz 	.print_boolean_true
	movq	decl_1@GOTPCREL(%rip), %rsi
	jmp 	.print_boolean_end
	.print_boolean_true:
		movq	decl_0@GOTPCREL(%rip), %rsi
	.print_boolean_end:
		call 	print_string
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

_main:
	call	t_main
	mov 	$0x02000001, %rax
	xor 	$0, %rdi
	syscall
/*t_printString: skip*/
t_printString:
/*pmb s0*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$0, %rsp
/*printString(str)*/
	movq	16(%rbp), %rsi
	movq	(%rsi), %rsi

	call	print_string
/*rtn s0*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/*t_main: skip*/
t_main:
/*pmb s1*/
	push	%rbp
	mov 	%rsp, %rbp
	subq	$16, %rsp
/*constString = "Hi! 😀\n"*/
	movq	decl_2@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
/*varString = "Hola\n"*/
	movq	decl_3@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*printString("Hello, world\n")*/
	movq	decl_4@GOTPCREL(%rip), %rsi
	call	print_string
/*printString(constString)*/
	movq	-8(%rbp), %rsi
	call	print_string
/*printString(varString)*/
	movq	-16(%rbp), %rsi
	call	print_string
/*varString = "Adios\n"*/
	movq	decl_5@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*printString(varString)*/
	movq	-16(%rbp), %rsi
	call	print_string
/*param_s "749\n"*/
	leaq	decl_6@GOTPCREL(%rip), %rax
	push	%rax
/*call s0*/
	call	t_printString
/*param_s constString*/
	lea 	-8(%rbp), %rax
	push	%rax
/*call s0*/
	call	t_printString
/*rtn s1*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

.section __DATA, __data
	decl_0: .asciz "true\n"
	decl_1: .asciz "false\n"
	decl_2: .asciz "Hi! 😀\n"
	decl_3: .asciz "Hola\n"
	decl_4: .asciz "Hello, world\n"
	decl_5: .asciz "Adios\n"
	decl_6: .asciz "749\n"