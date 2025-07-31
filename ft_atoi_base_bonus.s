section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

; extern int		ft_atoi_base(char const *str, char const *base);
;                                         rdi              rsi

section .text
	global ft_atoi_base

ft_atoi_base:
    xor eax, eax    ; initialise return value of = 0 in eax since we return an int
    test rdi, rdi   ;
    jz .exit        ;
    test rdi, rdi,  ;
    jz .exit        ;
    mov dl, [rdi]   ;

.spaces:            ; TODO: skip whitespaces

.sign:              ; TODO: determine if res is neg or pos

.loop:
    sub dl, '0'         ; substract 48
    cmp dl, 9           ;
    ja .exit            ;
    imul eax, eax, 10   ;
    add eax, edx        ;
    inc rdi             ;
    mov dl, [rdi]       ;
    cmp dl, 0           ;
    jnz .loop           ;

.exit:
    ret