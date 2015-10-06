/* 
 * File:   main.cpp
 * Author: Amul Bham
 * Purpose: To code Assembly
 * if else, else, and switch statement 
 * in C++ prior to translating to 
 * Assembly Language 
 * Created on October 6, 2015, 1:40 PM
 */

//System Libraries
#include <cstdlib>
#include <iostream>



using namespace std;



//Execution Begins here !
int main(int argc, char** argv) {
    //Declare Variables
    char days; //days of the week m-f
    
    cout<<"Enter the number of day which you attend class"<<endl;
    cin>>days;
    
    //Use a switch statement to guide the program of the users choice
    switch(days){
        case 'M':
            cout<<"11"<<endl;break;
        case 'T':
            cout<<"5"<<endl;break;
        case 'W':
            cout<<"11"<<endl;break;
        case 'TH':
            cout<<"5"<<endl;break;
        case 'F':
            cout<<"1"<<endl;break;
        default:
            cout<<"0"<<endl;break;
    }
    
    
    return 0;
}

