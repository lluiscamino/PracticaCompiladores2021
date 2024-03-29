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
	subq	$20, %rsp
/*goto e0*/
	jmp 	e0
/*e0: skip*/
e0:
/*printBoolean(-1)*/
	movb	$-1, %bl
	call	print_boolean
/*goto e3*/
	jmp 	e3
/*e3: skip*/
e3:
/*printBoolean(0)*/
	movb	$0, %bl
	call	print_boolean
/*goto e4*/
	jmp 	e4
/*e4: skip*/
e4:
/*printBoolean(-1)*/
	movb	$-1, %bl
	call	print_boolean
/*goto e7*/
	jmp 	e7
/*e7: skip*/
e7:
/*printBoolean(0)*/
	movb	$0, %bl
	call	print_boolean
/*str1 = "Hello, world!\n"*/
	movq	str_3@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
/*str2 = "Hello, world!\n"*/
	movq	str_4@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
/*if str1 = str1 goto e8*/
	movq	-8(%rbp), %rsi
	movq	-8(%rbp), %rdi
	call 	compare_strings
	cmpb	$-1, %dl
	je  	e8
/*t14 = 0*/
	movb	$0, %al
	movb	%al, -17(%rbp)
/*goto e9*/
	jmp 	e9
/*e8: skip*/
e8:
/*t14 = -1*/
	movb	$-1, %al
	movb	%al, -17(%rbp)
/*e9: skip*/
e9:
/*printBoolean(t14)*/
	movb	-17(%rbp), %bl
	call	print_boolean
/*if str1 != str1 goto e10*/
	movq	-8(%rbp), %rsi
	movq	-8(%rbp), %rdi
	call 	compare_strings
	cmpb	$-1, %dl
	jne 	e10
/*t15 = 0*/
	movb	$0, %al
	movb	%al, -18(%rbp)
/*goto e11*/
	jmp 	e11
/*e10: skip*/
e10:
/*t15 = -1*/
	movb	$-1, %al
	movb	%al, -18(%rbp)
/*e11: skip*/
e11:
/*printBoolean(t15)*/
	movb	-18(%rbp), %bl
	call	print_boolean
/*if str1 = str2 goto e12*/
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	call 	compare_strings
	cmpb	$-1, %dl
	je  	e12
/*t16 = 0*/
	movb	$0, %al
	movb	%al, -19(%rbp)
/*goto e13*/
	jmp 	e13
/*e12: skip*/
e12:
/*t16 = -1*/
	movb	$-1, %al
	movb	%al, -19(%rbp)
/*e13: skip*/
e13:
/*printBoolean(t16)*/
	movb	-19(%rbp), %bl
	call	print_boolean
/*if str1 != str2 goto e14*/
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	call 	compare_strings
	cmpb	$-1, %dl
	jne 	e14
/*t17 = 0*/
	movb	$0, %al
	movb	%al, -20(%rbp)
/*goto e15*/
	jmp 	e15
/*e14: skip*/
e14:
/*t17 = -1*/
	movb	$-1, %al
	movb	%al, -20(%rbp)
/*e15: skip*/
e15:
/*printBoolean(t17)*/
	movb	-20(%rbp), %bl
	call	print_boolean
/*goto e16*/
	jmp 	e16
/*e16: skip*/
e16:
/*printBoolean(-1)*/
	movb	$-1, %bl
	call	print_boolean
/*goto e19*/
	jmp 	e19
/*e19: skip*/
e19:
/*printBoolean(0)*/
	movb	$0, %bl
	call	print_boolean
/*rtn s0*/
	movq	%rbp, %rsp
	pop 	%rbp
	ret

/**
 * Compares two strings (saves result to %dl)
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
		movb	$0, %dl
		jmp 	.compare_strings_end
	.compare_strings_true:
		movb	$-1, %dl
	.compare_strings_end:
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

.section __DATA, __data
	decl_0: .asciz "true\n"
	decl_1: .asciz "false\n"
	decl_2: .quad 0
	str_3: .asciz "Hello, world!\n"
	str_4: .asciz "Hello, world!\n"
