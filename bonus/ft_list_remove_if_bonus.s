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
    mov r8, rdi         ; save original lst pointer in r8
    mov r12, rsi        ; save data_ref in r12
    mov r13, rdx        ; save cmp function in r13
    mov r14, rcx        ; save free function in r14

.compare:
    mov rbx, [r8]       ; rbx = current node
    test rbx, rbx       ; check for end of list
    jz .exit            ;
    mov rdi, rbx        ; rdi = data_ref
    mov rsi, r12        ; rsi = data from node
    call r13            ; call cmp function once the arguments are set
    cmp rax, 0          ; if rax = 0, then we must remove node
    jne .next           ; skip and iterate over otherwise

.remove:
    mov rdi, [rbx]      ; get node->data
    call r14            ; call free(node->data)
    
    mov rax, [rbx + 8]  ; rax = current->next
    mov [r8], rax       ; *current_ptr = current->next (unlink current node)
    
    mov rdi, rbx        ; prepare to free the node itself
    call r14            ; free(current_node)
    
    jmp .compare        ; check the new node at this position

.next:
	lea r8, [rbx + 8]	; advance the memory address of the parameter by 8 bytes/64 bits
	jmp .compare		; repeat comparison over next node

.exit:
	ret