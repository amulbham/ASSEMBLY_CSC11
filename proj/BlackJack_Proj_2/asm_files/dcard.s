.data
.balign 4
message: .asciz "My card total is %d\n\n\n"

.balign 4
return4: .word 0

.balign 4
current: .asciz "%d"

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

.balign 4
card_t: .word 0
 
.text

.global _dcard
_dcard:
    push {lr} 

	mov r4,r0                   /* Setup loop counter */
	mov r5, #0
	mov r0,#0                    /* Set time(0) */
    bl time                      /* Call time */
	bl srand                     /* Call srand */
	
    loop_rand:                
	bl rand                      /* Call rand */
	mov R1,r0,ASR #1             /* In case random return is negative */
	mov r2,#52                 
		                         
	bl divMod                    /* Call divMod function to get remainder */
	add R1,#2					
	
	cmp R1, #14
	BLE _hearts
	
	cmp R1, #27
	BLE _diamonds
	
	cmp R1, #40
	BLE _cloves
	
	BGT _spades
	
	_hearts:
	mov r3, #1
	b _continue
	
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
	
	_addtotal:
	/*Add the running total of the cards to the card total*/
	mov R5, r1
	mov R6, R3
	
	cmp r4, #1
	bgt _skip
	bl printf
	
	_skip:
	cmp R6, #1
	BEQ _h
	cmp R6, #2
	BEQ _d
	cmp R6, #3
	BEQ _c

	b _s
	
	_h:
	cmp r4, #1
	bgt _loop
	ldr r0, output_hearts
	bl printf
	b _loop
	_d:
	cmp r4, #1
	bgt _loop
	ldr r0, output_diamonds
	bl printf
	b _loop
	_c:
	cmp r4, #1
	bgt _loop
	ldr r0, output_cloves
	bl printf
	b _loop
	_s:
	cmp r4, #1
	bgt _loop
	ldr r0, output_spades
	bl printf
	b _loop
	
	_loop:
	sub r4,#1
	cmp r4,#0
	bgt loop_rand
	
	mov r1, R5
	
	
    pop {lr} 
	bx lr 
 
address_of_message: .word message
address_of_return4: .word return4
cardt: .word card_t
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
