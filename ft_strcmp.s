section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strcmp

ft_strcmp:
	mov eax, 0  		; initialise the return value in eax: int = 32 bits

.loop:
	mov al, [rsi]		; copy character from arg1 into 8-bit register AL
    mov dl, [rdi]       ; do the same for arg2
    cmp al, dl          ; compare *arg1 to *arg2
    jne .diff           ; jump to diff if not equal
	inc rsi				; advance memory address in arg1
	inc rdi				; and in arg2
    test al, al         ; check for null-byte in arg1
    je .exit            ;
    test dl, dl         ; do the same check for arg2
	jmp .loop			; continue if not null

.diff:
    sub al, dl
    movsx eax, al
    ret    

.exit:
	ret