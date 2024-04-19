.data               # start of data section
# put any global or static variables here
n: 			.long 0
inputMsg: 	.string "Enter the value for n where n is the number of digits of the Fibonacci sequence: "
outputMsg:  .string "The first n digits of the Fibonacci sequence are: \n"
formatInt: 	.string "%d"
formatLong: .string "%lu "
newLine:    .string "\n"

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!


.text           # start of text /code
# everything inside .text is read-only, which includes your code!
.global main  # required, tells gcc where to begin execution

# === functions here ===

main:           # start of main() function
# preamble
pushq %rbp
movq %rsp, %rbp

# === code here ===

# Get the value of n as input from user
movq $inputMsg, %rdi
xor %rax, %rax
call printf	# Print "Enter the value for n where n is the number of digits of the Fibonacci sequence: "
movq $formatInt, %rdi
movq $n, %rsi
xor %rax, %rax
call scanf # Read the value of n

# Print the output message
movq $outputMsg, %rdi
xor %rax, %rax
call printf	# Print "The first n digits of the Fibonacci sequence are: \n"

# Print first n numbers of the Fibonacci sequence
movq $1, %rbx # Loop counter
print_loop:
movl %ebx, %edi # Set the parameter
call fibonacci # call fibonacci(n) to find the nth number of the Fibonacci sequence
movq $formatLong, %rdi
movq %rax, %rsi
xor %rax, %rax
call printf # Print the nth number of the Fibonacci sequence
incl %ebx # increment loop counter
movq $n, %rax
movl (%rax), %ecx # %ecx has n
cmp %ecx, %ebx # Loop until all n numbers have been printed
jbe print_loop

# Print a new line
movq $newLine, %rdi
xor %rax, %rax
call printf	# Print a new line

# return
movq $0, %rax   # place return value in rax
leave           # undo preamble, clean up the stack
ret             # return

# Function that returns nth number of the Fibonacci sequence
# Receives n in %edi where n >=1
# Returns nth number of the Fibonacci sequence in %rax
fibonacci:
# preamble
pushq %rbp
movq %rsp, %rbp

# Case: n = 1
cmp $1, %edi # In case n is 1
je fibonacci_return0 # return 0

# Case: n = 2
cmp $2, %edi # In case n is 2
je fibonacci_return1 # return 1

# Case: n > 2 
movq $0, %r8 # f1 = 0 
movq $1, %r9 # f2 = 1

xorq %rcx, %rcx
movl %edi, %ecx 
subl $2, %ecx # Loop counter set to n-2
 
fibonacci_loop: # Loop to find the nth Fibonacci number
movq %r8, %rax
addq %r9, %rax # next = f1+ f2
movq %r9, %r8 # f1 = f2
movq %rax, %r9 # f2 = next
loop fibonacci_loop
jmp fibonacci_return

fibonacci_return0:
movq $0, %rax # Return 0
jmp fibonacci_return

fibonacci_return1:
movq $1, %rax # Return 1

# Return back to main
fibonacci_return:
leave           # undo preamble, clean up the stack
ret             # return
