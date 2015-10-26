/* 
 * File:   main.cpp
 * Author: Amul Bham
 * Assembly 11 - Midterm
 * Solutions in C - Problems 1 - 3
 * 
 *
 * Created on October 26, 2015, 12:12 PM
 */

#include <cstdlib>
#include <iostream>
#include <stdio.h>

using namespace std;

void prob1();
void prob2();
void prob3();
int main(int argc, char** argv) {
    _menu:
    unsigned int R0;
    printf("Enter a number for the problem you would like to see\n"
            "Problems 1-3 or 4 to exit\n");
    scanf("%d",&R0);
    
    if (R0 == 1){prob1(); goto _menu;}
    else if (R0 == 2){prob2(); goto _menu;}
    else if (R0 == 3){prob3(); goto _menu;}
    else if (R0 == 4){goto _exit;}
    else{goto _menu;}
   
    _exit:
    return 0;

}

void prob1(){
    printf("Problem 1:Gross Pay\n");
    //Declare Variables
    unsigned int R0;             //hours worked
    unsigned int R1;            //rate of pay 
    unsigned int R2;            //Gross pay
    
    //Initialize Variables - get user input
    printf("Please enter your rate of pay\n");
    scanf("%d",&R1);
    printf("Enter the amount of hours worked\n");
    scanf("%d",&R0);
    
    //Determine pay rate accounting for overtime
    //hrs and rtePy are passed as parameters to the functions
    //Each should be a function that the program branches too based on the hours worked.
    
    //Use an if statement to determine which rate of pay the user falls in
    if (R0<=40){
        goto _sTime;
    }else if(R0>40 && R0<=50){
        goto _dTime;
    }else{
        goto _tTime;
    }
    
    //So first should be cmp to 40, 50 and 60
    _sTime:
    R2 = (R1*R0); //given first twenty hours are fulfilled
    goto _output;
    _dTime:
    R2 = (R1*40)+ ((R0-40)*(2*R1));
    goto _output;
    _tTime:
    R2 = (R1*40)+ (2*R1 * 10) + (R0-50)*(3*R1);
    goto _output;

   
    //Output the gross pay of the user
    _output:
    printf("Your gross pay is $");
    printf("%d",R2);
    cout<<"\n";

}
void prob2(){
    printf("In problem # 2: ISP Packages\n");
    _prob2:
    //Declare Variables
    char R0; //User input for which package they have
    unsigned int R1 = 0;   //User input for hours spent online
    unsigned int R2 = 0; //monthly charge for Internet service
   
    printf("Please select which tier of service you currently own \n"
    "(a)  $30 per month, 11 hours access\n"
    "(b)  $35 per month, 22 hours access\n"
    "(c)  $40 per month, 33 hours access\n");
    //User inputs their choice of package that they currently own     
    printf("Type in your choice here\n");
    cin>>R0;
    
    printf("How many hours did you spend using the Internet\n");
    scanf("%d",&R1);
    
    if (R0 == 'a'){goto _tierA;}
    else if (R0 == 'b'){goto _tierB;}
    else if (R0 == 'c'){goto _tierC;}
    else{goto _prob2;}
    
    _tierA:
    R2 = 30;
    if (R1>11 && R1<=22){R2+=(R1-11)*3;}
    else if (R1>22){R2+=(3*11)+((R1-22)*6);}
    goto _output2; 
    _tierB:
    R2 = 35;
    if(R1>22 && R1<=44){R2+=(R1-22)*2;}
    else if (R1>44){R2+=(22*2)+((R1-44)*4);}
    goto _output2;
    _tierC:
    R2=40;
    if (R1>33 && R1<=66){R2+=(R1-33)*1;}
    else if (R1>66){R2+=(33*1)+((R1-66)*2);}
    goto _output2;
    
    _output2:
    //Output the monthly charges to the user
    printf("Your total monthly charges, including extra fees is $");
    printf("%d",R2);
    cout<<"\n";

}

void prob3(){
    //Declare variables
    unsigned int R0=0;   //value of the # requested
    unsigned int R1=1;   //previous value
    unsigned int R2=1;   //current value
    unsigned int R3=0;  //# of the sequence
    
    printf("In problem # 3: Fibonacci Sequence\n");
    printf("Which term of the Fibonacci Sequence would you like to see?\n");
    cin>>R3;
    //Loop until the fib sequence reaches the users desired number
    _loop:
    R0 = R1 + R2;
    R1 = R2;
    R2 = R0;
    R3--;
    if (R3!=2)goto _loop;
    //Print the Fibonacci sequence number 
    printf("%d",R0);
    cout<<"\n";
}
