
.global _start
_start:

MOV R0, #100 @ arbitrary values in R0 & R1
MOV R1, #20
_loop:
CMP R0, R1 @ Are they the same: Z=1?
BEQ _stop @ if so stop
BLT _less @ if R0 < than R1 go to less
SUB R0,R0,R1 @ otherwise sub R1 from R0
BAL _loop @ branch always back to start
_less:
SUB R1,R1,R0 @ subtract R0 from R1
BAL _loop @ branch always to the start


_stop:
MOV R7, #1
SWI 0

