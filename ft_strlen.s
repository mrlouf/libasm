section .data
; where you declare constant values, file names, buffer size, etc.

msg db 'Hello, world!', 0xa
len equ $ - msg

section .bss
; where you declare variables used in the program/function

section .text
	global _start

_start:
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax,1
	int 0x80
	
