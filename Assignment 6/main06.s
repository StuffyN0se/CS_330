#global data or static variables here
.data

#constants and strings here
.section

multString: .string "The answer is %d\n"

# A = 5, B = 8
#read only code starts here
.text 

.global main

multiByFive:
     
     pushq % rbx
     movq %rdi, %rax
     move $5, rbx
     lmulq %rbx

     popq %rbx
     ret

main:
pushq %rbp
movq %rsp, %rbp

#=====code below=======

movq $4, %rax
movq $8, %rbx

movq $multString, %rdi
movq %rax, %rsi
call printf
