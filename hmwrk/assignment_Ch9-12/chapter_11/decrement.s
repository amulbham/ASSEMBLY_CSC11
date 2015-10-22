.global _start

_start:
MOV R0, #100 @ arbitrary values in R0 & R1 
MOV R1, #20 
loop: 
CMP R0, R1 @ Are they the same
SUBGT R0,R0,R1 @ sub R1 from R0 if Great Than 
SUBLT R1,R1,R0 @ else sub R0 from R1 as Less 
BNE loop @ branch is not equal 

MOV R7, #1
SWI 0
