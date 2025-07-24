section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strlen

ft_strlen:
	mov rax, 0			; initialise the return value to 0

.loop:
	cmp byte [rdi], 0	; compare argument to 0
	je .exit			; exit when parameter is null
	inc rax				; otherwise increment return value in rax
	inc rdi				; and the pointer passed as parameter
	call .loop			; repeat iteration

.exit:
	ret