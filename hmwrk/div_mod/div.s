/*Amul Bham
9/30/15
Purpose: Output division of 16 and 3 */

.global _start
_start:

    /*Initialize the Registers*/
    MOV R1,#0          @Result of R3/R2
    MOV R2,#3          @Denominator
    MOV R3,#16;        @Numerator
    
    /*Loop and keep subtracting off the denominator*/
    MOV R0,R3          @Place the Numerator in R0
    _while_R0_GE_R2:   @Loop until the division is over
    CMP R0,R2
    BLT _output        @Exit and output the result
        ADD R1,R1,#1   @Increment the Division Counter
        SUB R0,R0,R2   @Subtract the Denominator from the Numerator
    BAL _while_R0_GE_R2

    /*Output the result*/
    _output:
    MOV R7,#1
    SWI 0
