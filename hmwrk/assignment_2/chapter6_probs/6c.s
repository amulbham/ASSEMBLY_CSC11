/*multiply two numbers R0,R1,R2*/

	.global _start
_start:
	MOV R1, #20 @R1 =20
	MOV R2, #5 @ R2 = 5
	MUL R0, R1, R2 @multiply and put into register 0
	MOV R7, #1 @exit through syscall
	SWI 0

