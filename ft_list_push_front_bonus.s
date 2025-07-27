section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_list_push_front


; extern void 	ft_list_push_front(void **begin_list, void *new);
;	new->next = *lst;
;	*lst = new;

ft_list_push_front:
    mov rax, [rdi]          ; rax = *begin_list
    mov [rsi + 8], rax      ; new->next = *begin_list 
    mov [rdi], rsi          ; *begin_list = new
	ret