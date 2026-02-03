%macro FILENAME 0
section .data
filename db 'Grace_kid.s',0
%endmacro
%macro CODE 0
code db '%%macro FILENAME 0%1$csection .data%1$cfilename db %3$cGrace_kid.s%3$c,0%1$c%%endmacro%1$c%%macro CODE 0%1$ccode db %3$c%4$s%3$c,0%1$c%%endmacro%1$c%%macro PROG 0%1$csection .text%1$cglobal main%1$cextern dprintf%1$cmain:%1$c%2$csub rsp, 8%1$c%2$cmov rax, 257%1$c%2$cmov rdi, -100%1$c%2$clea rsi, [rel filename]%1$c%2$cmov rdx, 577%1$c%2$cmov r10, 0644o%1$c%2$csyscall%1$c%2$ccmp rax, 0%1$c%2$cjle .error%1$c%2$clea rsi, [rel code]%1$c%2$cmov rdi, rax%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 39%1$c%2$clea r9, [rel code]%1$c%2$cpush rdi%1$c%2$csub rsp, 8%1$c%2$ccall dprintf wrt ..plt%1$c%2$cmov	rax, 3%1$c%2$cadd rsp, 8%1$c%2$cpop rdi%1$c%2$csyscall%1$c%2$cadd rsp, 8%1$c%2$cxor rax, rax%1$c%2$cret%1$c.error:%1$c%2$cadd rsp, 8%1$c%2$cmov rax, 1%1$c%2$cret%1$c%%endmacro%1$c;required comment%1$cFILENAME%1$cCODE%1$cPROG%1$c',0
%endmacro
%macro PROG 0
section .text
global main
extern dprintf
main:
	sub rsp, 8
	mov rax, 257
	mov rdi, -100
	lea rsi, [rel filename]
	mov rdx, 577
	mov r10, 0644o
	syscall
	cmp rax, 0
	jle .error
	lea rsi, [rel code]
	mov rdi, rax
	mov rdx, 10
	mov rcx, 9
	mov r8, 39
	lea r9, [rel code]
	push rdi
	sub rsp, 8
	call dprintf wrt ..plt
	mov	rax, 3
	add rsp, 8
	pop rdi
	syscall
	add rsp, 8
	xor rax, rax
	ret
.error:
	add rsp, 8
	mov rax, 1
	ret
%endmacro
;required comment
FILENAME
CODE
PROG
