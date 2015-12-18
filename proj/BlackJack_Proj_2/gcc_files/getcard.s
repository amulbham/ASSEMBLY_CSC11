/*Function used to generate a random card value, 
assign that card value a suit, and then add the 
card value to the players running card total*/
.data

.balign 4
current: .asciz "%d"
/*Output for each face value and suit value*/
.balign 4
hearts: .asciz " of hearts\n"
.balign 4
diamonds: .asciz " of diamonds\n"
.balign 4
cloves: .asciz " of cloves\n"
.balign 4
spades: .asciz " of spades\n"

.balign 4
jack: .asciz "Jack"

.balign 4
queen: .asciz "Queen"

.balign 4
king: .asciz "King"

.balign 4
ace: .asciz "Ace"

.text

.global _getcard

_getcard:
	/*push the lr and any local variable to the stack*/
    push {r4,r5,r6,r7,r8,lr} 
	
	mov r4,r0
	/*Based on the value 2-53, the card is assigned a suit*/
	cmp R1, #14
	BLE _hearts
	
	cmp R1, #27
	BLE _diamonds
	
	cmp R1, #40
	BLE _cloves
	
	BGT _spades
	/*Hold the suit in r3, subtract accordingly so the card value falls between 2-14*/
	_hearts:
	mov r3, #1
	b _continue
	
	/*After the suit is determined, a value must be applied if the card is a face card,
	else the value of the card is the number representation*/
	_continue:
	cmp R1,#14
	BEQ _sub4
	cmp R1,#13
	BEQ _sub3
	cmp R1,#12
	BEQ _sub2
	cmp R1,#11
	BEQ _sub1
	
	ldr R0, current_card
	b _addtotal
	
	_diamonds:
	mov r3, #2
	sub R1,#13
	b _continue
	
	
	_cloves:
	mov r3, #3
	sub R1,#26
	b _continue
	
	_spades:
	mov r3, #4
	sub R1,#39
	b _continue
	/*If the card is a face, a number must be subtracted off so it equils 10 or 11 if its an ace*/
	_sub4:
	sub R1,#3
	ldr R0, output_ace
	b _addtotal
	_sub3:
	sub r1,#3
	ldr R0, output_king
	b _addtotal
	_sub2:
	sub r1,#2
	ldr R0, output_queen
	b _addtotal
	_sub1:
	sub r1,#1
	ldr R0, output_jack
	b _addtotal
	
	/*Once the suit and face value cards are dealt with, the running card total is determined*/
	_addtotal:
	/*Add the running total of the cards to the card total*/
	add R4, R4,r1
	mov R6, R3
	bl printf
	/*Then the output is given to the user*/
	cmp R6, #1
	BEQ _h
	cmp R6, #2
	BEQ _d
	cmp R6, #3
	BEQ _c

	b _s
	/*First the card, followed by the suit is outputted*/
	_h:
	ldr r0, output_hearts
	bl printf
	b _loop
	_d:
	ldr r0, output_diamonds
	bl printf
	b _loop
	_c:
	ldr r0, output_cloves
	bl printf
	b _loop
	_s:
	ldr r0, output_spades
	bl printf
	b _loop
	
	_loop:
	/*store the running total back into r1 for main*/
	add r4, r4, r1
	mov r0,r4

	/*pop back the lr to go back to the main function*/

    pop {r4,r5,r6,r7,r8,lr}  
	bx lr 
	
 /*Addresses for each suit and face value card*/
current_card: .word current
output_hearts: .word hearts
output_diamonds: .word diamonds
output_cloves: .word cloves
output_spades: .word spades
output_jack: .word jack
output_queen: .word queen
output_king: .word king
output_ace: .word ace

/*External Functions*/
.global printf
.global time
.global srand
.global rand
