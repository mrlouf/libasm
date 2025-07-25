section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strdup
    extern __errno_location
    extern malloc

ft_strdup:
    test rdi, rdi   ; if null-pointer, exit
    jz .exit        ;
    mov esi, rdi    ; get the pointer address from arg1 into esi

.strlen:
    
    add esi, 1      ; move to next element of the array
    jmp .strlen     ; iterate

.exit:
    ret
