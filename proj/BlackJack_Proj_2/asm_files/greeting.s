
/*Greeting function - displays the rules to the user if they are not familiar
->Allowed the rules of the game to remain separate from the main logic
of the game.
->Only needed to display rules, no input or other action required thus 
making the function relatively simple and straight forward*/
.data
.balign 4
message1: .asciz "Basically the point of the game is to get to 21\nor as close as possible without going over\n"

.balign 4
message2: .asciz "I will deal 2 cards from a regular deck of cards\ndepending on the total value of these cards, you must\n"

.balign 4
message3: .asciz "decide if you want another card or stay where you are\n"

.balign 4
message4: .asciz "Also, note that my job as a dealer is to always hit if my card\nvalue is below 17, if i bust (go over 21) then you automatically win\n\n\n"
    
.text
.global _greeting

_greeting:
/*Output the rules to the user*/
push {r4,lr}

ldr R0, address_of_message1
bl printf

ldr R0, address_of_message2
bl printf

ldr R0, address_of_message3
bl printf

ldr R0, address_of_message4
bl printf

/*Link back to the main function*/
pop {r4,lr}
bx lr 

address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_message4: .word message4


/* External */
.global printf
.global scanf
