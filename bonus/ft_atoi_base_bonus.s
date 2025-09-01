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
    test rsi, rsi       ; test for null base
    jz .exit            ;
    push rdi            ; save str pointer
    mov rdi, rsi        ; rdi = base string for length counting
    xor r8, r8          ; r8 will hold base length

.base_len_loop:
    mov al, [rdi + r8]  ; load character from base
    cmp al, 0           ; check for null terminator
    je .base_len_done   ; if null, we're done counting

    cmp al, '+'
    je .exit_invalid    ; invalid base
    cmp al, '-'
    je .exit_invalid    ; invalid base
    cmp al, ' '
    je .exit_invalid    ; invalid base
    cmp al, 9           ; check for tab
    je .exit_invalid    ; invalid base
    
    inc r8              ; increment base length
    jmp .base_len_loop

.base_len_done:
    cmp r8, 2           ; base must be at least 2
    jb .exit_invalid    ; if less than 2, invalid
    
    pop rdi             ; restore str pointer
                        ; r8 now contains the base length
                        ; rsi still points to base string

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
                        ; TODO: Here you'll need to change this to work with any base
                        ; Instead of sub dl, '0' and cmp dl, 9
                        ; You'll need to find the index of dl in the base string
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

.exit_invalid:
    pop rdi             ; clean up stack in case something was pushed
    xor eax, eax        ; return 0 for invalid base
    ret