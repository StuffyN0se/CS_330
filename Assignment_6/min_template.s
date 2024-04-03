.data               # start of data section
# put any global or static variables here

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!
multString: .string "The mult answer is %d\n"

.text           # start of text /code
# everything inside .text is read-only, which includes your code!
.global main  # required, tells gcc where to begin execution

# === functions here ===
#function that takes a num, n, and multipies by 5
#takes one arg, n in %rdi
#returns whole num result in %rax
multiByFive:
    pushq %rbx

    movq %rdi, %rax
    movq $5, %rbx
    cqto
    imulq %rbx

    popq %rbx
    ret

main:           # start of main() function
# preamble
pushq %rbp
movq %rsp, %rbp

# === code here ===
#a = 5, b = 5, c = a * b = 25
movq $5, %rax           # a = 5, rax = 5
movq $5, %rbx           # b = 5, rbx = 5
imulq %rbx
movq $multString, %rdi
movq %rax, %rsi
xorq %rax, %rax
call printf

# return
movq $0, %rax   # place return value in rax
leave           # undo preamble, clean up the stack
ret             # return
