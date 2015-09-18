/*program 3b, part1.s file*/

    .global _start
_start:
    MOV Ro, #65
    BAL _part2
    
        .global _part2
_part2:
    MOV R7, #1
    SWI o
    /*program 3b, part1.s file*/

    