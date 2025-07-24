section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strcpy

ft_strcpy:
	test rdi, rdi		; test dest for null-pointer
	jz .exit			; exit if null-pointer
	test rsi, rsi		; test src for null-pointer
	jz .exit
	mov rax, rdi		; initialise the return value to dest

.loop:
	mov dl, [rsi]		; copy character from src into 8-bit register DL
	mov [rdi], dl		; copy from DL into dest
	cmp byte [rdi], 0	; now compare src to 0
	je .exit			; exit if null
	inc rsi				; increment address in dest
	inc rdi				; and src
	call .loop			; continue if not null

.exit:
	ret