
.data
/*Ask for choice*/
.balign 4
choice: .asciz "Enter a number 1-4 \n"

.balign 4
greeting1: .asciz "1.) Employee Payroll \n"

.balign 4
greeting2: .asciz "2.) ISP Bill \n"

.balign 4
greeting3: .asciz "3.) Fibonacci Sequence \n"

.balign 4
greeting4: .asciz "4.) Exit \n"

.balign 4
format: .asciz "%d"

.balign 4
option: .word 0

.balign 4
link: .word 0


.text
.global main

main:
_menu:
ldr r1, address_of_link
str lr, [r1]

ldr r0, address_of_choice 
bl printf

ldr r0, address_of_greeting1
bl printf

ldr r0, address_of_greeting2
bl printf

ldr r0, address_of_greeting3
bl printf

ldr r0, address_of_greeting4
bl printf

ldr R0, address_of_format
ldr R1, address_of_option
bl scanf 


cmp R1, #2
BLT one
one:
bl prob1

ldr r1, address_of_link
ldr lr, [r1]
bx lr
cmp choice, #4
BLE _menu




address_of_choice : .word choice
address_of_greeting1 : .word greeting1
address_of_greeting2 : .word greeting2
address_of_greeting3 : .word greeting3
address_of_greeting4 : .word greeting4
address_of_link: .word link
address_of_format : .word format
address_of_option : .word option

/* External */
.global printf
.global scanf