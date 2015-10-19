/* 
 * File:   main.cpp
 * Author: Amul Bham
 * Purpose: Example Menu
 * Covert all cout/cin -> printf/scanf
 * Convert all variables -> registers
 * Put functions in other files to compile
 * Convert Constructs to labels/gotos
 * Created on October 19, 2015, 11:25 AM
 */
//System Libraries
#include <cstdlib>
#include <iomanip>
#include <iostream>
using namespace std;

//Function Prototypes
void menu(void);
void problem1(int,int);
void problem2(int,int);

int main(int argc, char** argv) {
    //Declare Variables
    int beg,end,choice;

    //Loop until exit
    do{
        cout<<"Input beginning and End of temperature range"<<endl;
        cin>>beg>>end;
        cout<<"If range is degree Centigrade input 1"<<endl;
        cout<<"If range is degree Fahrenheit input 2"<<endl;
        cin>>choice;
        
        switch(choice){
            case 1: problem1(beg,end);break;
            case 2: problem2(beg,end);break;
        }
        
    }while(choice>0 && choice<3);

    return 0;
}

void problem2(int beg,int end){
    cout<<"Display Degree Centigrade to Degree Fahrenheit"<<endl;
    cout<<"Centigrade Fahrenheit"<<endl;
    for(int f=beg;f<=end;f++){
        int c = 5.0/9.0*(f-32);
        cout<<setw(6)<<f<<setw(12)<<c<<endl;
    }

}

void problem1(int beg,int end){
    cout<<"Display Degree Fahrenheit to Degree Centigrade"<<endl;
    cout<<"Fahrenheit Centigrade"<<endl;
    for(int c=beg;c<=end;c++){
        int f = 9.0/5.0*c+32;
        cout<<setw(6)<<c<<setw(12)<<f<<endl;
    }

}