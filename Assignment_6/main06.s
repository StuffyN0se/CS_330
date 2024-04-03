#global data or static variables here
.data

#constants and strings here
.section .rodata

multString: .string "The answer is %d\n"

# A = 5, B = 8
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
pushq %rbp
movq %rsp, %rbp

#=====code below=======

movq $4, %rdi
call multiByFive

movq $multString, %rdi
movq %rax, %rsi
call printf


movq $0, %rax
popq %rbp
ret


