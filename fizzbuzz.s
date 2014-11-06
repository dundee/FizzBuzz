section	.text
	global _start       
	global printchar

printchar:
	mov rcx, rax  ; store string address in rcx
	mov rax, 4    ; system call number (sys_write)
	mov rbx, 1    ; file descriptor (stdout)
	mov rdx, 1    ; length of string
	int 0x80      ; call kernel
	ret           ; return from function

_start:	                
	mov rcx, 100  ; loop count
	mov rax, '1'  ; start with char '1'
	
l1:
	mov [num], rax

	push rcx

	mov rax, num
	call printchar

	mov rax, endl
	call printchar

	;mov rax, 4
	;mov rbx, 1
        ;mov rcx, endl
        ;mov rdx, 1
        ;int 0x80      ; print endline

	mov rax, [num]
	inc rax
	pop rcx
	loop l1

	mov rax,1       ;system call number (sys_exit)
	int 0x80        ;call kernel

section	.bss
	num resb 1

section     .data
	endl     db  0xa
