.global _start

_start:
MOV R0,#1 @Initialise count
loop: 
ADD R0,R0,#1 @ Increment count 
CMP R0,#50 @ Compare with limit 
BLE loop 
MOV R7, #1
SWI 0

