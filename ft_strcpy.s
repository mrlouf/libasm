section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi		; initialise the return value to 0
	cmp byte [rdi], 0	; compare dest to 0
	je .exit			; if dest is 0, exit directly
	call .loop			; call loop

.loop:
	cmp byte [rax], 0	; compare dest to 0
	je .exit			; exit when dest is null 
	cmp byte [rsi], 0	; now compare src to 0
	je .exit			; also exit if null
	mov rax, [rsi]		; shallow copy of parameter
	inc rax				; increment address in rax
	inc rdi				; and the pointer passed as parameter
	call .loop			; repeat iteration

.exit:
	ret