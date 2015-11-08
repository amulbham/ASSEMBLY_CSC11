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

.balign
firstcards: .asciz "Now dealing your first two cards...\n"

.balign 4
continueA: .word 0

/*Card values*/
.balign 4
card1: .word 0

.balign 4
card2: .word 0 

.balign 4
total: .word 0

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

ldr R2, address_of_continueA
ldr R2, [R2]
cmp R2, #2
BGE _gloop
bl _greeting



_gloop:
ldr R0, address_of_firstcards
bl printf

mov R0, #2 
ldr R1, card_total
ldr R1, [R1]
bl _getcard





ldr lr, address_of_return 
ldr lr, [lr] 
bx lr 

address_of_return: .word return
address_of_opening: .word opening
address_of_opening2: .word opening2
address_of_continue: .word continue
address_of_continueA: .word continueA
address_of_firstcards: .word firstcards
card_1: .word card1
card_2: .word card2
card_total: .word total

/* External */
.global printf
.global scanf
