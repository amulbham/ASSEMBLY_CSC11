@Perform R0 = R1 +R2
	.global _start
_start: 
	MOV R1, #50 @get 50 into R1
	MOV R2, #60 @get 60 into R2
	ADDS R0, R1,R2 @RO=R1+R2
	MOV R7, #1 @exit through syscall
	SWI 0

