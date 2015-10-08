/*Amul Bham
Purpose: Use a forloop
to sum 1-10
10/7/2015*/



.global _start

_start:
MOV R0,#0
MOV R1,#1
MOV R2,#10
_loop:
ADD R0,R0,R1
CMP R2,R1
ADD R1,R1,#1
BNE _loop
BEQ _output

_output:
        MOV R7,#1
        SWI 0

