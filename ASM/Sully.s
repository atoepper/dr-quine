default rel
extern dprintf
extern sprintf
extern system
global main
section .data
i dq 5
filename_fmt db "Sully_%d.s", 0
exec_fmt db "Sully_%d", 0
compile_fmt db "nasm -f elf64 %1$s -o %2$s.o && gcc %2$s.o -o %2$s", 0
run_fmt db "./%s", 0
source_fmt db "default rel%1$cextern dprintf%1$cextern sprintf%1$cextern system%1$cglobal main%1$csection .data%1$ci dq %2$d%1$cfilename_fmt db %3$cSully_%%d.s%3$c, 0%1$cexec_fmt db %3$cSully_%%d%3$c, 0%1$ccompile_fmt db %3$cnasm -f elf64 %%1$s -o %%2$s.o && gcc %%2$s.o -o %%2$s%3$c, 0%1$crun_fmt db %3$c./%%s%3$c, 0%1$csource_fmt db %3$c%4$s%3$c, 0%1$csection .bss%1$cfilename  resb 64%1$cexecname  resb 64%1$ccmd resb 128%1$csection .text%1$cmain:%1$csub rsp, 8%1$cmov rax, [i]%1$ccmp rax, 0%1$cjl .exit%1$clea rdi, [filename]%1$clea rsi, [filename_fmt]%1$cmov rdx, rax%1$cxor rax, rax%1$ccall sprintf wrt ..plt%1$cmov rax, 257%1$cmov rdi, -100%1$clea rsi, [filename]%1$cmov rdx, 577%1$cmov r10, 0644o%1$csyscall%1$ctest rax, rax%1$cjs .exit%1$cmov r12, rax%1$cmov rdi, r12%1$clea rsi, [source_fmt]%1$cmov rdx, 10%1$cmov rcx, [i]%1$cdec rcx%1$cmov r8, 34%1$clea r9, [source_fmt]%1$cxor rax, rax%1$ccall dprintf wrt ..plt%1$cmov rdi, r12%1$cmov rax, 3%1$csyscall%1$clea rdi, [execname]%1$clea rsi, [exec_fmt]%1$cmov rdx, [i]%1$cxor rax, rax%1$ccall sprintf wrt ..plt%1$clea rdi, [cmd]%1$clea rsi, [compile_fmt]%1$clea rdx, [filename]%1$clea rcx, [execname]%1$cxor rax, rax%1$ccall sprintf wrt ..plt%1$clea rdi, [cmd]%1$ccall system wrt ..plt%1$ccmp qword [i], 0%1$cjl .exit%1$clea rdi, [cmd]%1$clea rsi, [run_fmt]%1$clea rdx, [execname]%1$cxor rax, rax%1$ccall sprintf wrt ..plt%1$clea rdi, [cmd]%1$ccall system wrt ..plt%1$c.exit:%1$cadd rsp, 8%1$cxor rax, rax%1$cret%1$c", 0
section .bss
filename  resb 64
execname  resb 64
cmd resb 128
section .text
main:
sub rsp, 8
mov rax, [i]
cmp rax, 0
jl .exit
lea rdi, [filename]
lea rsi, [filename_fmt]
mov rdx, rax
xor rax, rax
call sprintf wrt ..plt
mov rax, 257
mov rdi, -100
lea rsi, [filename]
mov rdx, 577
mov r10, 0644o
syscall
test rax, rax
js .exit
mov r12, rax
mov rdi, r12
lea rsi, [source_fmt]
mov rdx, 10
mov rcx, [i]
dec rcx
mov r8, 34
lea r9, [source_fmt]
xor rax, rax
call dprintf wrt ..plt
mov rdi, r12
mov rax, 3
syscall
lea rdi, [execname]
lea rsi, [exec_fmt]
mov rdx, [i]
xor rax, rax
call sprintf wrt ..plt
lea rdi, [cmd]
lea rsi, [compile_fmt]
lea rdx, [filename]
lea rcx, [execname]
xor rax, rax
call sprintf wrt ..plt
lea rdi, [cmd]
call system wrt ..plt
cmp qword [i], 0
jl .exit
lea rdi, [cmd]
lea rsi, [run_fmt]
lea rdx, [execname]
xor rax, rax
call sprintf wrt ..plt
lea rdi, [cmd]
call system wrt ..plt
.exit:
add rsp, 8
xor rax, rax
ret
