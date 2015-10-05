/* 
 * File:   main.cpp
 * Author: Amul Bham
 * Created on 10/05/2015
 * Purpose: Write code for shifted division in
 * C first to allow us to understand the concepts
 * of Branching 
 */

//System Libraries
#include <iostream> //I/O stream
using namespace std;

//User Libraries

//Global Constants

//Function Prototypes

//Execution begins here
int main(int argc, char** argv) {
    //Declaration of variables, working registers
    unsigned int R0;        //Result of R5%R4 start with Numerator
    unsigned int R1;        //Result of R5/R4 start with 0
    unsigned int R2;        //Increment value start with 1
    unsigned int R3;        //Decrement value start with Denominator
    //Declaration of variables holding inputs
    unsigned int R4=10;      //Denominator
    unsigned int R5=21;    //Numerator
    //Initialize the working registers with the data
    R0=R5;R1=0;R2=1;R3=R4;
    //Shift the denominator left until greater than numerator, then shift back
    _shift_left:
        R3<<=1;             //Denominator shift left
        R2<<=1;             //Division shift left
    if(R0>R3)goto _shift_left;//Shift Left until Decrement/Division Greater than Numerator
    R3>>=1;                 //Shift Denominator right
    R2>>=1;                 //Shift Division right
    //Loop and keep subtracting off the shifted Denominator
    _subtract:
    if(R0<R3)goto _output;
        R1+=R2;             //Increment division by the increment
        R0-=R3;             //Subtract shifted Denominator with remainder of Numerator
        //Shift right until denominator is less than numerator
        _shift_right:
        if(R2==1) goto _subtract;
        if(R3<=R0)goto _subtract;
            R2>>=1;         //Shift Increment left
            R3>>=1;         //Shift Denominator left
        goto _shift_right;  //Shift Denominator until less than Numerator
    goto _subtract;      //Keep Looping until the division is complete
    //Output the results
    _output:
    cout<<R5<<"/"<<R4<<"="<<R1<<endl;
    cout<<R5<<"%"<<R4<<"="<<R0<<endl;
    //Exit Stage Right
    return 0;
}