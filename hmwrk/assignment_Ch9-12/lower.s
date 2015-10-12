
.global _start

_start:
CMP R5, #255 @ Compare contents of R5 with 0xFF 
SUBLT R5,R5,R6 @ If R5<0xFF subtract R6 from R5 & save result in R5 
MOV R7,#1
SWI 0
