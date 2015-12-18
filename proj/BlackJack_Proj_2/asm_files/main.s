/*Name:  Amul Bham
Purpose: Develope BlackJack game in ARM assembly language
		 and throughly implement core concepts learned throughout
		 the semester 
Date: 	 12/16/2015
Main function of Blackjack game*/

.data
/*Below are all the text I had to output to the user 
or the format of input for user inputed text
Includes all the messages displayed for the greeting, 
format of input for hit or miss, and general messages 
to the player to keep them moving along the game*/

.balign 4
opening: .asciz "Welcome to ARM BlackJack!\n"
.balign 4
opening2: .asciz "Would you like to hear the rules to play? 1 for yes, 2 for no\n"
.balign 4
continue: .asciz "%d"
.balign 4
firstcards: .asciz "Now dealing your first two cards...\n"
.balign 4
dfcards: .asciz "Now dealing my first card...\n"
.balign 4
hit: .asciz "Would you like to hit(1) or stay (2)\n"
.balign 4
message: .asciz "card total: %d\n\n\n"
.balign 4
finish: .asciz "And now the rest of my hand...\n"
.balign 4
win: .asciz "Well played! You win the hand! \n"
.balign 4
lose: .asciz "You lose! Better luck next time!\n"
.balign 4
tie: .asciz "Looks like we have a draw...\n"
.balign 4
lose21: .asciz "You busted! Better luck next time!\n"
.balign 4
playagain: .asciz "Would you like to play again? 1 - yes / 2- no\n"


/*Below are all the memory addresses used for user input*/
.balign 4
continueA: .word 0
.balign 4
hitorstay: .word 0 
.balign 4
pagain1: .word 0

/*Card values - dealer card total and player card total*/
.balign 4
card1: .word 0
.balign 4
card2: .word 0 
.balign 4
total: .word 0
.balign 4
total2: .word 0

.balign 4
arr: .skip 232


.text

.global main


main:
/*store the link register*/
push {lr}

/*Output the greeting, and rules if the user does not know how to play*/
ldr R0,address_of_opening
bl printf

ldr R0, address_of_opening2
bl printf

ldr R0, address_of_continue
ldr R1, address_of_continueA
bl scanf

ldr r6, address_of_continueA
ldr r6, [r6]

cmp r6, #2
BGE _gloop
bl _greeting

_gloop:
/*Variables to track the players running card totals, reset after each hand*/
ldr r8, card_1
ldr r9, card_2


_start:	
/*Output the players first two cards*/
ldr R0, address_of_firstcards
bl printf

ldr r3, arr_cards
bl _mkdeck

mov r6, #1
mov r7,#0
ldr r1, card_1
ldr r0, pcard_total
_phand:
add r10,r3,r6,lsl #2
str r10, [r1] 
add r6, r6, #1
add r7, r7,#1
bl _getcard
cmp r7, #2
blt _phand

str r0, [r8]
mov r1, r0
ldr r0, address_of_message 
bl printf

/*If the user has hit a 21 on the first 2 cards, skip the hit or stay portion and finish dealers hand*/
cmp r8, #21
BEQ _dealerhand

/*Output the dealers first card*/
ldr R0, address_of_dfirstcards
bl printf
add r6,r6,#1
add r9,r3,r6,lsl #2
str r9, [r1] 
ldr r1,[r1]
ldr r0, dcard_total
ldr r0, [r0]
bl _getcard
mov r9, r0
mov r1, r0
ldr r0, address_of_message 
bl printf

/*After dealer first card, the user must decide to hit or stay, keeps looping till
user hits 21, busts, or decides to stay*/
_hit:
ldr r0, address_of_hit
bl printf

ldr r0, address_of_continue
ldr r1, address_of_hitorstay
bl scanf

ldr R7, address_of_hitorstay
ldr R7, [R7]
ldr r0, pcard_total
ldr r0, [r0]
/*If the user decides to stay, finish the rest of the dealer hand*/
cmp R7, #1
BGT _dealerhand
add r6,r6,#1
add r8,r3,r6,lsl #2
str r8, [r1]
ldr r1,[r1]
bl _getcard
/*Output the card total, store the card total in r8*/

mov r8,r0
mov r1,r0
ldr r0, address_of_message   
bl printf

/*Determine if the user has busted or hit 21, else go back to hit or stay*/
cmp r8, #21
BEQ _dealerhand
BLT _hit
BGT _plose21

/*The dealer continues their hand, loop until their card total is 17 or higher*/
_dealerhand:

ldr r0,address_of_finish
bl printf
ldr R0, dcard_total 
ldr r0, [r0]
_newcard:
add r6,r6,#1
add r9,r3,r6,lsl #2
str r9, [r1]
ldr r1, [r1]
bl _getcard
mov r9,r0
mov r1,r0
ldr r0, address_of_message   
bl printf
cmp r9, #17
/*If card total is less than 17, loop back for another card*/
bge _end
blt _newcard

/*Output the results of the game to the user*/
_end:
/*If the dealer has busted, the user automatically wins*/
cmp r9, #21
bgt _pwin

/*Else, determine whose card value was higher*/
cmp r8, r9
bgt _pwin
beq _tie
blt _plose

/*Output for the results of the game, win lose or tie*/
_plose:
ldr r0, address_of_lose
bl printf
b _playagain

_pwin:
ldr r0, address_of_win
bl printf
b _playagain

_plose21:
ldr r0, address_of_plose21
bl printf
b _playagain

_tie:
ldr r0, address_of_tie
bl printf
b _playagain

/*After determining a winner, let the player decide if they would like to play again*/
_playagain:
ldr r0, address_of_playagain
bl printf

ldr r0, address_of_continue
ldr r1, pagain
bl scanf

ldr r4, pagain
ldr R4, [R4]

cmp r4, #1
/*Branch to the start of the game loop if yes, else exit the program*/
beq _gloop
b _exit


_exit:
/*Pop back the lr and exit the program*/

pop {lr} 
bx lr


/*Addresses for all my significant memory allocations*/
address_of_opening: .word opening
address_of_opening2: .word opening2
address_of_continue: .word continue
address_of_continueA: .word continueA
address_of_hitorstay: .word hitorstay
address_of_firstcards: .word firstcards
address_of_dfirstcards: .word dfcards
address_of_hit: .word hit
card_1: .word card1
card_2: .word card2
pcard_total: .word total
dcard_total: .word total2
pagain: .word pagain1
address_of_message: .word message
address_of_finish: .word finish
address_of_lose: .word lose
address_of_win: .word win
address_of_tie: .word tie
address_of_plose21: .word lose21
address_of_playagain: .word playagain
arr_cards: .word arr


/*External Functions*/
.global printf
.global scanf
.global time
.global srand
.global rand
