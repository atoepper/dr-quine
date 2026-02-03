global main
extern printf

section .data
	code db 'global main%1$cextern printf%1$c%1$csection .data%1$c%2$ccode db %3$c%4$s%3$c, 0%1$csection .text%1$c;This is the outside comment%1$cget_code:%1$c%2$clea rax, [rel code]%1$c%2$cret%1$c%1$cmain:%1$c%2$c;This is the inside comment%1$c%2$ccall get_code%1$c%2$cmov rdi, rax%1$c%2$cmov rsi, 10%1$c%2$cmov rdx, 9%1$c%2$cmov rcx, 39%1$c%2$cmov r8, rdi%1$c%2$csub rsp, 8%1$c%2$cxor rax, rax%1$c%2$ccall printf wrt ..plt%1$c%2$cadd rsp, 8%1$c%2$cxor rax, rax%1$c%2$cret%1$c', 0
section .text
;This is the outside comment
get_code:
	lea rax, [rel code]
	ret

main:
	;This is the inside comment
	call get_code
	mov rdi, rax
	mov rsi, 10
	mov rdx, 9
	mov rcx, 39
	mov r8, rdi
	sub rsp, 8
	xor rax, rax
	call printf wrt ..plt
	add rsp, 8
	xor rax, rax
	ret
