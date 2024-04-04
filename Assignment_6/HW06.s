.data
#defines varbles num1, num2, and solutiont then assigns a value to them
A: .quad 5
B: .quad 10
result: .quad 0

.section .rodata

#variables with string values one for each expression
solution01: .string "A * 5 is %d\n"
solution02: .string "(A + B) - (A/B) is %d\n"
solution03: .string "(A - B) + (A*B) is %d\n"

.text

.global main

main:

#preamble
pushq %rbp
movq %rsp, %rbp

#=====code below=======
movq A(%rip), %rax          #stores the value of num1 in rax
movq B(%rip), %rbx          #stores the value of num2 in rbx

#==== Expression 1 ====

pushq %rax
pushq %rbx

movq $5, %rbx       
 
imulq %rbx, %rax          #points at top of stack (rbx = num2) and multiplies it by with rax (num 1) stores product in rax
movq %rax, result(%rip)     #moves the result from rax into the result variable

movq $solution01, %rdi      #moves my first string into rdi
movq %rax, %rsi             #puts rax (result) into rsi
movq $0, %rax               #moves 0 into rax
call printf                 #prints the string in solution01

popq %rbx
popq %rax

#==== Expression 2 ====

pushq %rax
pushq %rbx

#(A + B) - (A/B)
movq %rax, %rcx             #adds rax(A) into rcx
movq %rbx, %rdx             #adds rbx(B) into rdx

idivq %rdx
movq %rdx, result(%rip)
addq %rcx, %rbx             #adds A and B and puts sum into rbx
movq result(%rip), %rax
subq %rax, %rdx

movq $solution02, %rdi      #moves the solution02 string into rdi to print
movq %rdx, %rsi             #moves the solutioni into rsi to print
movq $0, %rax               
call printf 

popq %rax
popq %rbx

movq $0, %rax               #moves 0 into rax
popq %rbp                   
leave
ret