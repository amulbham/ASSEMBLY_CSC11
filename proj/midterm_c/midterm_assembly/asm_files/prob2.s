.data
.balign 4
message1: .asciz "Please select the tier of service you currently own \n"

.balign 4
message2: .asciz "1.)$30 per month, 11 hours access\n"

.balign 4
message3: .asciz "2.)$35 per month, 22 hours access\n" 

.balign 4
message4: .asciz "3.)$40 per month, 33 hours access\n"  

.balign 4
message5: .asciz "How many hours did you spend using the Internet?\n"

.balign 4
answer: .asciz "%d"

.balign 4
output: .asciz "Your total monthly charges, including fees is $%d\n"

.balign 4
tier: .word 0

.balign 4
hours: .word

.balign 4
charges: .word

.balign 4
return: .word

.balign 4
return2: .word


.text
.global prob2

_tier1:
ldr r2, address_of_return2 
str lr, [r2]

MOV R1, #30

cmp R0, #11
BLE _exit
cmp R0, #22
BLE _tier1a
BGT _tier1b

_tier1a:
SUB R0, R0, #11
ADD R0, R0, R0, LSL#1
ADD R1,R1, R0
BAL _exit

_tier1b:
MOV R2, #11
MOV R3, #3 
MOV R4, #6

SUB R0, R0, #22
MUL R5, R0, R4
MUL R4, R3, R2
ADD R4, R4,R5
ADD R1,R1, R4
BAL _exit

_exit:
ldr lr, address_of_return2 
ldr lr, [lr] 
bx lr

_tier2:
ldr r2, address_of_return2 
str lr, [r2]
MOV R1, #35

cmp R0, #22
BLE _exit1
cmp R0, #44
BLE _tier2a
BGT _tier2b

_tier2a:
SUB R0, R0, #22
MOV R0,R0, LSL#1
ADD R1,R1, R0
BAL _exit1

_tier2b:
MOV R6, #22
MOV R4, R6, LSL#1
SUB R0, R0, #44
MOV R0, R0, LSL#2
ADD R0, R0, R4
ADD R1, R1, R0
BAL _exit1

_exit1:
ldr lr, address_of_return2 
ldr lr, [lr] 
bx lr

_tier3:
ldr r2, address_of_return2 
str lr, [r2]

MOV R1, #40

cmp R0, #33
BLE _exit2
cmp R0, #66
BLE _tier3a
BGT _tier3b

_tier3a:
SUB R0, R0, #33
ADD R1, R1, R0
BAL _exit2

_tier3b:
MOV R5,#33
SUB R0, R0, #66
MOV R0, R0, LSL#1
ADD R0, R0, R5
ADD R1, R1, R0
BAL _exit2

_exit2:
ldr lr, address_of_return2 
ldr lr, [lr] 
bx lr


_t1: bl _tier1
BAL _output

_t2: bl _tier2
BAL _output

_t3: bl _tier3
BAL _output

address_of_return2: .word return2

prob2:

ldr r1, address_of_return3 
str lr, [r1]

ldr R0, message_1
bl printf

ldr R0, message_2
bl printf

ldr R0, message_3
bl printf

ldr R0, message_4
bl printf

ldr R0, format_of_answer1
ldr R1, tier_
bl scanf

ldr R0, message_5
bl printf

ldr R0, format_of_answer1
ldr R1, hours_
bl scanf

ldr R0, hours_
ldr R0, [R0]

ldr R1, charges_
ldr R1, [R1]

ldr R6, tier_
ldr R6, [R6]

cmp R6, #1
BEQ _t1
cmp R6, #2
BEQ _t2
cmp R6, #3
BEQ _t3

_output:
ldr R0, output_
ldr R1, charges_
bl printf

ldr lr, address_of_return3
ldr lr, [lr]
bx lr

address_of_return3: .word return
message_1: .word message1
message_2: .word message2
message_3: .word message3
message_4: .word message4
message_5: .word message5
tier_: .word tier
hours_: .word hours
charges_: .word charges
format_of_answer1: .word answer
output_: .word output


/* External */
.global printf
.global scanf

