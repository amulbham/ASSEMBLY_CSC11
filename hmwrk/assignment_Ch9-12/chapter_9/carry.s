.global _start

_start:
ADDS R0,R0,#255 @ Add 0xFF to R0 and save in R0. 
ADDCS R1,R1,#15 @ If Carry=1 add 0x0F to R1 save in R1 
ADDCC R1,R1,#128 @ If Carry=0 add 0xF0 to R1 save in R1 
MOV R7,#1
SWI 0
