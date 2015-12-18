.data

.text 
.global _mkdeck	
	
_mkdeck:	
	/*push the lr and any local variable to the stack*/
    push {r4,r5,r6,r7,r8,lr} 
	
	mov r5, #0

	
	/*Setup a loop counter in r4, keep a running card total in r5*/
	
	mov r0,#0                    /* Set time(0) */
    bl time                      /* Call time */
	bl srand                     /* Call srand */
	
	_nCard:
	add r5, r5, #1
	bl rand                      /* Call rand */
	mov R1,r0,ASR #1             /* In case random return is negative */
	mov r2,#52                  
		                         
	bl divMod                    /* Call divMod function to get remainder */
	/*Add two to the random number as a deck of cards starts at 2*/
	add R1,#2	
	
	add r7,r3,r5, LSL #2
	str r1,[r7]
	
	cmp r5, #52
	blt _nCard
	
    pop {r4,r5,r6,r7,r8,lr}  
	bx lr
	
	

.global printf
.global scanf
.global time
.global srand
.global rand
	