.data 
/*Display problem number*/
.balign 4
greeting1: .asciz "Problem 1: Gross Pay \n"

/*Ask for rate of pay*/
.balign 4
rate: .asciz "Please enter your rate of pay \n"

/*Set the format of the scan f*/
.balign 4
format: .asciz "%d"

/*Ask for hours worked*/
.balign 4
hrsmsg: .asciz "Please enter your hours worked \n"

/*Address of the rate of pay value*/
.balign 4
rate_value: .word 0

/*Address of the hours worked*/
.balign 4
hours: .word 0

/*Gross pay*/
.balign 4
gross: .word 0

/*Address for output gross pay*/
.balign 4
output: .asciz "Your Gross pay is $ %d \n"

.balign 4
return: .word 0

.balign 4
return2: .word 0



.text
calc_gross:
ldr r3, address_of_return2 
str lr, [r3]

cmp R1,#40
BLE _regtime
cmp R1,#50
BLE _double
BAL _triple

_regtime:
MUL R2, R1,R0
ldr lr, address_of_return2 
ldr lr, [lr] 
bx lr



_double:
MOV R4, #40
MUL R2, R1,R4
SUB R0, R0,R4
MOV R1,R1, LSL#1
MLA R2, R0,R1,R2

ldr lr, address_of_return2 
ldr lr, [lr] 
bx lr


_triple:
MOV R7, #40
MOV R8, #10
MOV R9, #50
MUL R4, R1,R7
MOV R1, R1, LSL #1
MOV R10, R1
MUL R1, R8, R10
SUB R6, R0,R9
ADD R1,R1,R1,LSL#1 
MOV R10, R6
MUL R6, R1, R10
ADD R2, R4,R5
ADD R2, R2,R6  	



ldr lr, address_of_return2 
ldr lr, [lr] 
bx lr

address_of_return2 : .word return2
.global main

main:

ldr r1, address_of_return 
str lr, [r1]

/*Display the problem number*/
ldr R0, address_of_greeting1
bl printf

/*Ask the user for rate of pay*/
ldr R0, address_of_ratemsg
bl printf

/*Take the user input for rate of pay, store in address of rate*/
ldr R0, address_of_format
ldr R1, address_of_rate
bl scanf 

ldr R0, address_of_hrsmsg
bl printf
	
ldr R0, address_of_format
ldr R1, address_hours_worked
bl scanf

ldr R0, address_of_rate
ldr R0, [R0]
ldr R1, address_hours_worked
ldr R1, [R1]
ldr R2, address_of_gross
ldr R2, [R2]
bl calc_gross

MOV R1, R2
ldr R0, address_of_output
bl printf

ldr lr, address_of_return 
ldr lr, [lr]
bx lr

address_of_greeting1 : .word greeting1
address_of_ratemsg : .word rate
address_of_hrsmsg : .word hrsmsg
address_of_format : .word format
address_of_rate: .word rate_value	
address_hours_worked: .word hours
address_of_gross: .word gross
address_of_output: .word output
address_of_return : .word return

/* External */
.global printf
.global scanf