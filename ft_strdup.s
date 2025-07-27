section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_strdup
    extern __errno_location
    extern malloc

ft_strdup:
    test rdi, rdi           ; if null-pointer, exit
    jz .exit                ;
    mov rsi, rdi            ; get the pointer address from arg1 into rsi
    xor rcx, rcx            ; initialise rcx (counter register) to 0

.len:
	cmp byte [rsi + rcx], 0	; str[0 + i] == '\0'?
	je .alloc			    ; exit when arg1 is null ('\0')
	inc rcx				    ; otherwise increment counter
	jmp .len			    ; repeat iteration

.alloc:
    add rcx, 1              ; add plus one to account for null byte
    mov rdi, rcx            ; save length into rdx
    call malloc wrt ..plt   ; malloc as many bytes as the value of rdi
    test rax, rax           ; check if malloc failed
    jz .failure             ;
    xor rdx, rdx            ; initialise second counter to 0

.copy:
    mov dl, [rsi + rdx]     ; move one byte from src to 8-bit register
    mov [rax + rdx], dl     ; copy byte into dest
    test dl, dl             ; check if null-byte
    jz .exit                ; exit if null-byte
    inc rdx                 ; otherwise increment and continue
    jmp .copy               ;

.failure:
    neg rax                             ; rax = -error_code
    mov rdi, rax                        ; save error_code before it is overwritten by errno call
    call __errno_location wrt ..plt     ; call errno via Procedure Linkage Table (PLT) instead of via absolute address (against PIE)
    mov [rax], rdi                      ; 
    mov rax, -1                         ; return -1 to caller to indicate failure
    ret

.exit:
    ret
