/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on October 19, 2015, 11:23 AM
 * Purpose:  Example Menu
 *           Convert all cout/cin -> printf/scanf
 *           Convert constructs to labels/goto's
 *           Convert all variables -> registers
 *           Put functions in other files to compile
 *           Make sure to convert 5/9 and 9/5 to binary pointsexit
 */

//System Libraries
#include <iostream>
#include <iomanip>
#include <stdio.h>



using namespace std;

//Function Prototypes
void menu(void);

//User Libraries
#include "cels.h" //conversion to fahr from C
#include "fahr.h" //conversion from c to f

//Execution Begins Here!
int main(int argc, char** argv) {
    //Declare variables
    unsigned int R0,R1,R2;
    //Loop until exit
        _main:
        printf("Input beginning and end of temperature range\n");
        scanf("%d",&R0);
        scanf("%d",&R1);
        printf("If range is degree Centigrade input 1\n");
        printf("If range is degree Fahrenheit input 2\n");
        scanf("%d",&R2);
        if (R2 == 1)goto _cels;
        else if (R2 == 2)goto _fahr;
        else goto _exit;
            _cels: problem1(R0,R1);
            goto _main;
            _fahr: problem2(R0,R1);
            goto _main;
   //If user wants to end program, go here 
    _exit:
    //Exit stage right
    return 0;
}


