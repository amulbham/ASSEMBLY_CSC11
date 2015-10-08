/* 
 * File:   main.cpp
 * Author: Amul Bham
 * Purpose: Code a while loop
 * and a do while loop
 * in C for assembly translation 
 * Sum of number 1-10
 * Created on October 7, 2015, 3:51 PM
 */

#include <cstdlib>
#include <iostream>

using namespace std;
//Global Library

//User Libraries

//Function Prototypes


//Execution begins here
int main(int argc, char** argv) {
    /****************Do while Loop*********************/
    //Declare Variables
    int sum;
    int i =1;
    //Use a do while loop to sum the values 1-10
    do{
        sum+=i;
        i++;
    }while(i<=10);
    //Output the sum
    cout<<"Do-While Loop:"<<endl;
    cout<<"The sum is "<<sum<<endl;
    
    
    /******************While Loop********************/
    //Reset the variables back to starting position  
    i =1;
    sum = 0;
    //Use a while loop to sum up the values 1-10
    while(i<=10){
        sum+=i;
        i++;
    }
    //Output the results of the while loop
    cout<<"While Loop:"<<endl;
    cout<<"The sum is "<<sum<<endl;
    
    
    //Exit the stage right;
    return 0;
}

