section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

;         ft_list_remove_if(&lst, (void *)s2, (int (*)(void *, void *))strcmp, free);
;                           rdi     rsi                             rdx         rcx

section .text
	global ft_list_remove_if

ft_list_remove_if:
    test rdi, rdi       ; usual null-pointer-check if lst is NULL
    jz .exit            ;

.compare:
    mov rax, [rdi]      ; preserve rdi for later
    mov rdi, rsi        ; rdi = data_ref
    mov rsi, [rax]      ;
    call rdx            ; call cmp function once the arguments are set
    cmp rax, 0          ; if rax = 0, then we must remove node
    jne .next           ; skip and iterate over otherwise

.remove:
    mov rdi, [rdi]      ; set argument for the free function
    call rcx            ; no need to check return value since free() does not return

.next:
	mov rdi, [rdi + 8]	; advance the memory address of the parameter by 8 bytes/64 bits
    test rdi, rdi       ; test for null ptr
	jnz .compare		; repeat comparison over next node

.exit:
	ret