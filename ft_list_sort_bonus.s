; how to use the rdi (reg for 2nd parameter) to call a function from a pointer:
; mov rdi, [rsi]  ; Load the first argument for cmp into rdi
; mov rsi, [rdx]  ; Load the second argument for cmp into rsi
; call rsi        ; Call the cmp function

; how to call the cmp function and use the return value:
; call rsi        ; Call the cmp function
; cmp rax, 0      ; Compare the return value to 0
; jl .swap        ; If rax < 0, jump to swap logic

