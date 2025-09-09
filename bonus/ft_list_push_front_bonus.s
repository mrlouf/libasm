section .data
; where you declare constant values, file names, buffer size, etc.

section .bss
; where you declare variables used in the program/function.

section .text
	global ft_list_push_front


; extern void ft_list_push_front(t_list **begin_list, void *data);
;										rdi				rsi

ft_list_push_front:
    mov rax, [rdi]          ; rax = *begin_list, rax serves as a temporary holder to switch rsi & rdi without losing data
    mov [rsi + 8], rax      ; new->next = *begin_list 
    mov [rdi], rsi          ; *begin_list = new
	ret