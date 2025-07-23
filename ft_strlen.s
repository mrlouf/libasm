section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function

section .text
	global ft_strlen

ft_strlen:
	mov rax,rdi			; get first (and only) argument
	cmp rax,0			; compare argument to 0
	je .exit			; if argument is 0, exit directly
	mov eax,1			; else count
	ret

.exit:
	mov eax,0
	ret