section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

; extern int		ft_atoi_base(char const *str, char const *base);
;                                         rdi              rsi

section .text
	global ft_atoi_base

ft_atoi_base:
    xor eax, eax        ; initialise return value of = 0 in eax since we return an int
    xor ecx, ecx        ; initialise ecx to act as a sign register to multiply the end result without
    inc ecx             ; ecx = 1
    test rdi, rdi       ; test for null source
    jz .exit            ;
    test rdi, rdi,      ; test for null base
    jz .exit            ;

.spaces:                ;
    mov dl, [rdi]       ;
    cmp dl, ' '         ; check for normal space (ASCII 32)
    je .skip_space      ;
    sub dl, 9           ;
    cmp dl, 4           ; 
    ja .sign            ;

.skip_space:            ;
    inc rdi             ;
    jmp .spaces         ;

.sign:                  ;
    mov dl, [rdi]       ;
    cmp dl, '-'         ; check for negative sign
    jne .loop           ;
    mov ecx, -1         ; ecx = -1
    inc rdi             ; load next byte
    mov dl, [rdi]       ;

.loop:
    sub dl, '0'         ; substract 48
    cmp dl, 9           ;
    ja .exit            ; check if value is between 0-9, handling underflow/overflow
    imul eax, eax, 10   ; multiply eax by 10 to make room for new digit otherwise
    add eax, edx        ;
    inc rdi             ; advance one byte into source str
    mov dl, [rdi]       ; load the byte into dl
    cmp dl, 0           ; check for end of string
    jnz .loop           ; if not end, then loop again

.exit:
    imul eax, ecx       ;
    ret