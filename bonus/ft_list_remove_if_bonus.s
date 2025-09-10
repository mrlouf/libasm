section .data

section .bss

; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
;                           rdi    				 rsi              rdx     			    rcx

section .text
	global ft_list_remove_if

ft_list_remove_if:
    push r12
    push r13
    push r14
    push r15
    mov r12, rdi            ; reassigning registers to not push / pop everywhere
    mov r13, rsi
    mov r14, rdx
    mov r15, rcx

	; NULL-check of all arguments
	test r12, r12			; if (begin_list == NULL) exit
	jz .exit
	test r13, r13			; if (data_ref == NULL) exit
	jz .exit	
	test r14, r14			; if (cmp == NULL) exit
	jz .exit	
	test r15, r15			; if (free_fct == NULL) exit
	jz .exit

    mov rdx, [rdi]          ; rdx = current (dereferencing **lst)
    mov rcx, 0              ; rcs = previous node = null by default


.loop:
    cmp rdx, 0              ; if current node is null, exit
    je .exit
    mov rdi, [rdx]          ; rdi = current->data (dereferencing *lst)
    mov rsi, r13            ; rsi = data_ref
    push rdx                ; not callee-safe registers push
    push rcx
    call r14                ; compare
    pop rcx
    pop rdx
    cmp rax, 0              ; check if the data matches
    jne .loop_skip          ; if not, then skip

    cmp rdx, [r12]          ; data is same, is it head node?
    je .free_head           ; if head node, we need to update head ptr
							; else prepare to free current->data, then current

							; rewire previous->next so that it points to current->next
    mov rdi, [rdx + 8]      ; rdi: current->next
    mov [rcx + 8], rdi      ; prev->next = current->next
    mov rdi, [rdx]          ; rdi is current->data
    push rcx
    push rdx
    test r15, r15           ; check if r15 (free function pointer) is not null
    je .skip_free_data
    call r15                ; free current->data
							; free does not return any value, so ignore rax after the call

.skip_free_data:
    pop rdx
    mov rdi, rdx            ; free current
    call r15
    pop rcx
    mov rdx, [rcx + 8]      ; not changing previous, only current
    jmp .loop

.loop_skip:
    mov rcx, rdx			; advance the list, one node at the time
    mov rdx, [rdx + 8]
    jmp .loop

.free_head:
    mov rdi, [rdx + 8]
    mov [r12], rdi
    mov rdi, [rdx]

    push rdx
    push rcx
    call r15                ; free(current->data)
    pop rcx
    pop rdx

    mov rdi, rdx
    push rcx
    push rdx
    call r15     			; free(current)
    pop rdx
    pop rcx

    mov rdx, [r12]
    jmp .loop

.exit:
    pop r15
    pop r14
    pop r13
    pop r12
    ret