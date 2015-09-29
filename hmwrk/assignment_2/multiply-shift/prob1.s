
/*
	Amul Bham
	9/28/2015
	Conversion Months to years
	R1 - NUMBER OF MONTHS
	R2 - COVERSION OF MONTHS TO YEARS
	R3 - NUMBER OF YEARS:
*/

	.global _start
	_start:
	
		MOV R1, #88	@BP 0 wD 7
		LDR R2, =0x155556 	@BP-24 WD24
		MUL R0, R2, R1	@@BP-24 WD31
		LSR R0, #24	@BP 0 WD 7
		MOV R7, #1
		SWI 0
 
