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
	subq	$96, %rsp
/*goto e0*/
	jmp 	e0
/*e0: skip*/
e0:
/*t2 = -1*/
	movq	$-1, %rax
	movq	%rax, -8(%rbp)
/*e1: skip*/
e1:
/*printBoolean(t2)*/
	movq	-8(%rbp), %rbx
	call	print_boolean
/*t5 = 0*/
	movq	$0, %rax
	movq	%rax, -16(%rbp)
/*goto e3*/
	jmp 	e3
/*e3: skip*/
e3:
/*printBoolean(t5)*/
	movq	-16(%rbp), %rbx
	call	print_boolean
/*goto e4*/
	jmp 	e4
/*e4: skip*/
e4:
/*t8 = -1*/
	movq	$-1, %rax
	movq	%rax, -24(%rbp)
/*e5: skip*/
e5:
/*printBoolean(t8)*/
	movq	-24(%rbp), %rbx
	call	print_boolean
/*t11 = 0*/
	movq	$0, %rax
	movq	%rax, -32(%rbp)
/*goto e7*/
	jmp 	e7
/*e7: skip*/
e7:
/*printBoolean(t11)*/
	movq	-32(%rbp), %rbx
	call	print_boolean
/*str1 = "Hello, world!\n"*/
	movq	str_3@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)
/*str2 = "Hello, world!\n"*/
	movq	str_4@GOTPCREL(%rip), %rax
	movq	%rax, -48(%rbp)
/*if str1 = str1 goto e8*/
	movq	-40(%rbp), %rsi
	movq	-40(%rbp), %rdi
	call 	compare_strings
	cmpq	$-1, %rdx
	je  	e8
/*t14 = 0*/
	movq	$0, %rax
	movq	%rax, -56(%rbp)
/*goto e9*/
	jmp 	e9
/*e8: skip*/
e8:
/*t14 = -1*/
	movq	$-1, %rax
	movq	%rax, -56(%rbp)
/*e9: skip*/
e9:
/*printBoolean(t14)*/
	movq	-56(%rbp), %rbx
	call	print_boolean
/*if str1 != str1 goto e10*/
	movq	-40(%rbp), %rsi
	movq	-40(%rbp), %rdi
	call 	compare_strings
	cmpq	$-1, %rdx
	jne 	e10
/*t15 = 0*/
	movq	$0, %rax
	movq	%rax, -64(%rbp)
/*goto e11*/
	jmp 	e11
/*e10: skip*/
e10:
/*t15 = -1*/
	movq	$-1, %rax
	movq	%rax, -64(%rbp)
/*e11: skip*/
e11:
/*printBoolean(t15)*/
	movq	-64(%rbp), %rbx
	call	print_boolean
/*if str1 = str2 goto e12*/
	movq	-40(%rbp), %rsi
	movq	-48(%rbp), %rdi
	call 	compare_strings
	cmpq	$-1, %rdx
	je  	e12
/*t16 = 0*/
	movq	$0, %rax
	movq	%rax, -72(%rbp)
/*goto e13*/
	jmp 	e13
/*e12: skip*/
e12:
/*t16 = -1*/
	movq	$-1, %rax
	movq	%rax, -72(%rbp)
/*e13: skip*/
e13:
/*printBoolean(t16)*/
	movq	-72(%rbp), %rbx
	call	print_boolean
/*if str1 != str2 goto e14*/
	movq	-40(%rbp), %rsi
	movq	-48(%rbp), %rdi
	call 	compare_strings
	cmpq	$-1, %rdx
	jne 	e14
/*t17 = 0*/
	movq	$0, %rax
	movq	%rax, -80(%rbp)
/*goto e15*/
	jmp 	e15
/*e14: skip*/
e14:
/*t17 = -1*/
	movq	$-1, %rax
	movq	%rax, -80(%rbp)
/*e15: skip*/
e15:
/*printBoolean(t17)*/
	movq	-80(%rbp), %rbx
	call	print_boolean
/*goto e16*/
	jmp 	e16
/*e16: skip*/
e16:
/*t20 = -1*/
	movq	$-1, %rax
	movq	%rax, -88(%rbp)
/*e17: skip*/
e17:
/*printBoolean(t20)*/
	movq	-88(%rbp), %rbx
	call	print_boolean
/*t23 = 0*/
	movq	$0, %rax
	movq	%rax, -96(%rbp)
/*goto e19*/
	jmp 	e19
/*e19: skip*/
e19:
/*printBoolean(t23)*/
	movq	-96(%rbp), %rbx
	call	print_boolean
/*rtn s0*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/**
 * Compares two strings (saves result to %rdx)
 * Params:
 * - %rsi: First string address
 * - %rdi: Second string address
 */
compare_strings:
	lea 	-1(%rsi), %rcx
	lea 	-1(%rdi), %rdx
	.Cloop:
		inc 	%rcx
		inc 	%rdx
		cmpb	$0, (%rcx)
		jne 	.compare_strings_continue
		cmpb	$0, (%rdx)
		je  	.compare_strings_true
		.compare_strings_continue:
			movb	(%rcx), %al
			cmpb	%al, (%rdx)
			je  	.Cloop
	.compare_strings_false:
		movq	$0, %rdx
		jmp 	.compare_strings_end
	.compare_strings_true:
		movq	$-1, %rdx
	.compare_strings_end:
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

.section __DATA, __data
	decl_0: .asciz "true\n"
	decl_1: .asciz "false\n"
	decl_2: .quad 0
	str_3: .asciz "Hello, world!\n"
	str_4: .asciz "Hello, world!\n"
