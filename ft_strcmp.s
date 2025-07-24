section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0  		; initialise the return value to dest

.loop:
	mov al, [rsi]		; copy character from arg1 into 8-bit register AL
    cmp al, [rdi]       ; compare *arg1 to *arg2
    jg .greater         ;
    jl .less            ;
	inc rsi				; advance memory address in arg1
	inc rdi				; and in arg2
    cmp byte [rsi], 0   ; check for null-byte in arg1
    je .exit            ;
	call .loop			; continue if not null

.greater:
    add al, [rdi]
    movsx rax, al         ; set return value in rax
    ret

.less:
    mov rax, [rdi]
    ret    

.exit:
	ret