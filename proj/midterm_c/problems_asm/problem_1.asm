.data 
/*Display problem number*/
.balign 4
greeting1: .asciz "Problem 1: Gross Pay \n "

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
output: .asciz "Your Gross pay is $%d \n"

.text
.global main

main:
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


cmp R1,40
BLE _regtime
cmp R1,50
BLE _double
BAL _triple

_regtime:
MUL R2, R1,R0

BAL _output

_double:
MUL R4, R1,40
SUB R5,R0,40
MUL R5, R5, R1, LSL#1
ADD R2, R4, R5
BAL _output

_triple:
MUL R4, R1,40
MUL R5, 10, R1, LSL#1
SUB R6, R0,50
ADD R1,R1,R1,LSL#1 
MUL R6, R1, R6
ADD R2, R4,R5
ADD R2, R2,R6  




_output:
ldr R0, address_of_output
ldr R1, address_of_gross
ldr R1, [R1]
bl printf

address_of_greeting1 : .word greeting1
address_of_ratemsg : .word rate
address_of_hrsmsg : .word hrsmsg
address_of_format : .word format
address_of_rate: .word rate_value	
address_hours_worked: .word hours
address_of_gross: .word gross
address_of_output: .word output

/* External */
.global printf
.global scanf