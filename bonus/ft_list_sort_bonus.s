; how to use the rdi (reg for 2nd parameter) to call a function from a pointer:
; mov rdi, [rsi]  ; Load the first argument for cmp into rdi
; mov rsi, [rdx]  ; Load the second argument for cmp into rsi
; call rsi        ; Call the cmp function

; how to call the cmp function and use the return value:
; call rsi        ; Call the cmp function
; cmp rax, 0      ; Compare the return value to 0
; jl .swap        ; If rax < 0, jump to swap logic

;    	ft_list_sort(t_list **begin_list, int (*cmp)());
;                       rdi                     rsi

section .text
	global ft_list_sort

ft_list_sort:
    test rdi, rdi       ; usual null-pointer-check if lst is NULL
    jz .exit            ;
    mov r8, rdi         ; save lst pointer in r8
    mov r12, rsi        ; save strcmp in r12

.getdata:
    mov rbx, [r8]       ; rbx = current node
    test rbx, rbx       ; check for end of list
    jz .exit

    mov r13, [rbx + 8]   ; r13 = next_node
    test r13, r13
    jz .exit

.compare:
    mov rdi, [rbx]      ;
    mov rsi, [r13]      ;
    call r12            ; strcmp(current->data, current->next->data)
    cmp rax, 0          ;
    jle .next           ; if (result < 0), continue to next nodes

.swap:
    
    mov rax, [rbx]      ;
    push rax            ; use the stack to keep the node temporarily
    mov rax, [r13]      ;
    mov [rbx], rax      ;
    pop rax             ;
    mov [r13], rax      ;

    jmp .getdata        ; start again from the beginning (bubble sort)

.next:
	mov r8, r13         ; r13 is the next node pointer
    jmp .getdata

.exit:
	ret