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
void problem1(unsigned int,unsigned int);
void problem2(unsigned int,unsigned int);

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
    
    _exit:
    //Exit stage right
    return 0;
}

void problem1(unsigned int R0,unsigned int R1){
    
    unsigned int R2 = R0;
    unsigned int R3;
    unsigned int R4 = 0x1C;
    
    printf("Display Degree Centigrade to Degree Fahrenheit\n");
    printf("Fahrenheit  Centigrade\n");
    _loop: 
    R4 = 0x1CD;
    R4*=R2;
    _shift:
    R4>>=8;
    R4+=32;
    cout<<"  "<<R4<<"         "<<R2<<endl;
    R2++;
    if (R2<=R1)  goto _loop;
    
}

void problem2(unsigned int R0,unsigned int R1){
    unsigned int R2 = R0;
    unsigned int R3;
    unsigned int R4 = 0x25;
    unsigned int R5 = R0;
    printf("Display Degree Centigrade to Degree Fahrenheit\n");
    printf("Fahrenheit  Centigrade\n");
    _loop: 
    R2 = R5;
    R4 =0x25;
    R2-=32;
    R4*=R2;
    _shift:
    R4>>=8;
    cout<<"  "<<R4<<"         "<<R2<<endl;
    R5++;
    if (R5<=R1)  goto _loop;
}