.data
/*Return address*/
.balign 4
return: .word 0

/*address of text to be displayed*/
.balign 4
message1: .asciz "Which term of the Fibonacci Sequence would you like to see? \n"

/*address of the number the user would like to see*/
.balign 4
sequence: .word 0

/*Set the format of the scan f and printf*/
.balign 4
format: .asciz "%d \n"

/*address of the fib number*/
.balign 4
fib: .word 0

/*Address for output*/
.balign 4
output: .asciz "%d \n"

.text
.global prob3

prob3:

ldr r1, address_of_return 
str lr, [r1]

ldr R0, address_of_message1
bl printf

ldr R0, format_of_answer
ldr R1, sequence_number
bl scanf

ldr R0, fib_number
ldr R0, [R0]
ldr R1, sequence_number
ldr R1, [R1]

MOV R2, #1
MOV R3, #1
MOV R4, #1

_loop:
MOV R0,R2
ADD R0, R0, R3
MOV R2, R3
MOV R3,R0
SUB R1, R1, R4
cmp R1,#2
MOV R1, R0
BGT _loop

MOV R1, R0
ldr R0, address_of_output
bl printf

ldr lr, address_of_return 
ldr lr, [lr]
bx lr


address_of_return : .word return
address_of_message1: .word message1
format_of_answer: .word format 
sequence_number: .word sequence
fib_number: .word fib
address_of_output: .word output


/* External */
.global printf
.global scanf