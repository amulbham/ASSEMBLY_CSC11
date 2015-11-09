/*Name: Amul Bham
Purpose: Develope BlackJack game in assembly language
Date: 11/5/2015
Main function of Blackjack Project*/

/*Address of the opening message*/
.data
/*address of return for link */
.balign 4
return: .word 0

.balign 4
opening: .asciz "Welcome to Amul Bham's BlackJack!\n"

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
deck: .word 0

.text

.global main

main:

ldr r1, address_of_return 
str lr, [r1]


ldr R0,address_of_opening
bl printf

ldr R0, address_of_opening2
bl printf

ldr R0, address_of_continue
ldr R1, address_of_continueA
bl scanf

ldr R6, address_of_continueA
ldr R6, [R6]
cmp R6, #2
BGE _gloop
bl _greeting

_gloop:

ldr r8, card_1
ldr r8, [r8]

ldr r9, card_2
ldr r9, [r9]

mov r9, #0
mov r8, #0

_start:	
ldr R0, address_of_firstcards
bl printf


mov R0, #2 
ldr r1, pcard_total
ldr r1, [r1]

bl _getcard

mov r8,r1
ldr r0, address_of_message 
bl printf


cmp r8, #21
BEQ _dealerhand

ldr R0, address_of_dfirstcards
bl printf

mov R0, #3
ldr r1, dcard_total
ldr r1, [r1]
bl _dcard
mov r9, r1
ldr r0, address_of_message 
bl printf


_hit:
ldr r0, address_of_hit
bl printf

ldr r0, address_of_continue
ldr r1, address_of_hitorstay
bl scanf

ldr R7, address_of_hitorstay
ldr R7, [R7]

cmp R7, #1
BGT _dealerhand
mov R0, #1 
ldr r1, pcard_total
ldr r1, [r1]
bl _getcard

add r1, r1, r8
mov r8, r1
ldr r0, address_of_message   
bl printf

cmp r8, #21
BEQ _dealerhand
BLT _hit
BGT _plose21

_dealerhand:
mov r5, #8
ldr r0,address_of_finish
bl printf
_newcard:
mov R0, r5 
ldr r1, dcard_total
ldr r1, [r1]
bl _dcard
add r1, r1, r9
mov r9,r1
ldr r0, address_of_message   
bl printf
add r5, r5,#1
cmp r9, #17
bge _end
blt _newcard

_end:
cmp r9, #21
bgt _pwin

cmp r8, r9
bgt _pwin
beq _tie
blt _plose

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


_playagain:
ldr r0, address_of_playagain
bl printf

ldr r0, address_of_continue
ldr r1, pagain
bl scanf

ldr r4, pagain
ldr R4, [R4]

cmp r4, #1
beq _gloop
b _exit


_exit:
ldr lr, address_of_return 
ldr lr, [lr] 
bx lr 

address_of_return: .word return
address_of_deck: .word deck
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




/*External Functions*/
.global printf
.global time
.global srand
.global rand
