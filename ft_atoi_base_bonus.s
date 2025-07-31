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
    ret