#global data or static variables here
.data
# A = 5, B = 8
A: .quad 5
B: .quad 8
result: .quad 0

#constants and strings here
.section .rodata

solution01: .string "A * 5 is %d\n"
solution02: .string "(A + B) - (A/B) is %d\n"
solution03: .string "(A - B) + (A*B) is %d\n"


#read only code starts here
.text 

.global main

multiByFive:
     
     pushq % rbx
     movq %rdi, %rax
     movq $5, %rbx
     mul %rbx
     popq %rbx
     ret

main:
#preamble
pushq %rbp
movq %rsp, %rbp

#=====code below=======

movq $5, %rdi
call multiByFive

movq $multString, %rdi
movq %rax, %rsi
movq $0, %rax
call printf


movq $0, %rax
popq %rbp
leave
ret


