/*Syscall 3 to read keyboard*/

	.global _start
_start:
_read:
	@read syscall
	MOV R7, #3 @syscall number
	MOV R0, #0 @input stream is keyboard
	MOV R2, #5 @read first 5 characters
	LDR R1, =string @string located at string:
	SWI 0
_write:
	MOV R7, #4 @syscall number
	MOV R0, #1 @output to the monitor
	MOV R2, #19 @string is 19 characters long
	LDR R1, = string @string at string
	SWI 0 
_exit:
	@exit syscall
	MOV R7, #1
	SWI 0
	.data
string:
	.ascii "Hello World String\n"

