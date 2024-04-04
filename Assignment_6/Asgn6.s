.data
#defines varbles num1, num2 then assigns a value to them
A: .quad 10
B: .quad 2

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

pushq %rax                  #pushes the the values in %rax and %rbx into the stack in that order
pushq %rbx

movq $5, %rbx               #moves the number 5 in the rbx register
 
imulq %rbx, %rax            #multiplies rax(A or 10) with rbx(5) and store the product in rax (now 50)

movq $solution01, %rdi      #moves my first string into rdi for printing 
movq %rax, %rsi             #puts rax (solution or 50) into rsi for printing
movq $0, %rax               #clears rax
call printf                 #calls the print function

popq %rbx                   #pops the values of rbx and rax in that order (lifo so reverse order of push)
popq %rax

#==== Expression 2 ====

pushq %rax                  #pops the value in rax to top of stack  (by pushing then popping after every expression I ensure that my original values of A and B are not changed)
pushq %rbx                  #pops the value in rax to top of stack

#(A + B) - (A/B)

movq %rax, %rcx             #adds rax(A) into rcx creating a copy
movq %rbx, %rdx             #adds rbx(B) into rdx creating a copy

addq %rdx, %rcx             #adds rcx(A) and rdx(B) and stores sum in rcx
                            #rcx = A = 10 and rdx = B = 2 --> 10 + 2 = 12 --> 12 = rcx

cqto                        #sign extends
                            #cqto will also affect the alue of rdx so the order of addition above is imporant
                            #doing addq %rcx, %rdx instead will result in the value in rdx to change from 2 to 0

idivq %rbx                  #divides rax(A) by rbx(B) and stores in rax
                            #rax = A = 10 rbx = B = 2 --> 10/2 = 5 --> 5 = rax

subq %rax, %rcx             #subtract rax(5) from rcx(12) and stores in rcx
                            #rax = 5 rdx = 12 --> 12 - 5 = 7 --> 7 = rcx

movq $solution02, %rdi      #moves the solution02 string into rdi to print
movq %rcx, %rsi             #moves the solution(rcx or 7) into rsi to print
movq $0, %rax               #clears rax
call printf                 #calls print function 

popq %rax                     #pops the values of rbx and rax in that order again
popq %rbx

#==== Expression 3 ====

pushq %rax                  #again pushing rax and rbx onto the top of stack
pushq %rbx

#==(A - B) + (A * B)==

movq %rax, %rcx             #adds rax(A) into rcx creating a copy
movq %rbx, %rdx             #adds rbx(B) into rdx creating a copy

imulq %rbx, %rax            #multiples rax by rbx and stores product in rax
                            #rax = 10 and rbx = 2 --> 10 * 2 = 20 --> rax = 20

subq %rcx, %rdx             # subtracts rcx(A) from rdx(B) and stores result in rdx
                            # A = 10 and B = 2 --> 10 - 2 = 8 --> rdx = 8

addq %rdx, %rax             #adds the products from previous two expressions and stores in rax
                            #rax = 20 and rdx = 8 --> 20 + 8 = 28 --> rax = 28

movq $solution03, %rdi      #moves my pretyped sentence into rdi to print
movq %rax, %rsi             #stores value of rax (the solution) into rsi for printing
movq $0, %rax               #clears rax
call printf                 #calls print function

#====close====
movq $0, %rax               #moves 0 into rax (clears rax)
leave                       #cleans up stack and restores it to orginal
ret                         #return