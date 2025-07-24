section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi		; initialise the return value to dest

.loop:
	mov dl, [rsi]		; copy character from src into 8-bit register DL
	mov [rdi], dl		; copy from DL into dest
	inc rsi				; advance memory address in dest
	inc rdi				; and in src
	cmp byte [rdi], 0	; now compare src to 0
	je .exit			; exit if null
	call .loop			; continue if not null

.exit:
	ret