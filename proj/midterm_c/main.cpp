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

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    
    cout<<"Problem 1: "<<endl<<endl;
    //Declare Variables
    unsigned int hrs;     //hours worked
    unsigned int rtePy; //rate of pay 
    unsigned int gPay;  //Gross pay
    
    //Initialize Variables - get user input
    printf("Please enter your rate of pay\n");
    scanf(rtePy);
    printf("Enter the amount of hours worked\n");
    scanf(hrs);
    
    //Determine pay rate accounting for overtime
    //hrs and rtePy are passed as parameters to the functions
    //Each should be a function that the program branches too based on the hours worked.
    
    //So first should be cmp to 40, 50 and 60
    unsigned int sTime = (rtePy*hrs); //given first twenty hours are fulfilled
    unsigned int dTime = (rtePy*40)+ ((hrs-40)*(2*rtePy));
    unsigned int tTime = (rtePy*40)+ (2*rtePy * 10) + (hrs-60)*(3*rtePy);
    
    
    //Use an if statement to determine which rate of pay the user falls in
    if (hrs<=40){
        goto sTime;
    }else if(hrs>40 && hrs<=50){
        goto dTime;
    }else{
        goto tTime;
    }
   //Output the gross pay of the user
    cout<<fixed<<showpoint<<setprecision(2);
    cout<<"Your Gross pay is $"<<gPay<<endl;
    cout<<endl;

     cout<<"In problem # 2"<<endl<<endl;
    
    cout<<"\nThis program calculates your monthly Internet bill \n"
        "and determines if switching to a higher tier will save \n"
        "you money\n\n";   

    //Declare Variables
    int choice; //User input for which package they have
    int hrs;    //User input for hours spent online
    float mCost; //monthly charge for Internet service
    float mSav; //money saved by switching to a new package 
    int sav;   //sentinel value used to determine which package will save money
    
    
    //Initialize variables - get user input
    cout<<"Please select which tier of service you currently own (1-3)\n"<<endl;
    cout<<"(1)  $16.85 per month, 5 hours access"<<endl;
    cout<<"(2)  $23.85 per month, 15 hours access"<<endl;
    cout<<"(3)  $29.55 per month unlimited access"<<endl;
    cin>>choice;
    
    cout<<"How many hours do you typically spend using the Internet?"<<endl;
    cin>>hrs;
   
    //Determine tier pricing
    float tier1=16.85;
    float tier2=23.85;
    float tier3=29.55;
   
    //Pricing for over charges 
    float tier1a=(tier1+((hrs-5)*0.8)); //first overcharge rate for tier1
    float tier1b=(tier1+(1*(hrs-20)+12)); //second overcharge rate for tier1
    float tier2a=(tier2+((hrs-15)*0.65));//first overcharge rate for tier2
    float tier2b=(tier2+(0.7*(hrs-25)+6.5));//second overcharge rate for tier2
    
    //Call the function to get monthly charge
    mCost = getMonthlycharge(choice,hrs); //calculates users monthly charge
    
    /*Use switch to compare monthly charge across all tiers
      Switch used to narrow scope, if else statement used to address 
      separate tiers within each package
    */ 
    switch(choice){
        case 1: //package 1
            if(tier1a>tier2 && hrs<=15){
                    mSav = tier1a-tier2;
                    sav = 2;break;
            }else if (tier1a>tier2a && hrs>15 && hrs<=20){
                mSav = tier1a-tier2a;
                sav =2; break;
            }else if (tier2a<tier3 && hrs>20 && hrs<=25){
                mSav = tier1b - tier2a;
                sav = 2; break;
            }else if (tier2a>tier3 && hrs>20 && hrs<=25){
                mSav = tier1b-tier3;
                sav=3;break;
            }else if (hrs>25){
                mSav = tier1b-tier3;
                sav=3;break;
            }else{
                sav = 0;
            }break;
        case 2: //package 2
            if (hrs<=5){
                mSav = tier2 - tier1;
                sav = 1;
                break;
            }else if (hrs>5 && hrs<=15 && tier2>tier1a){
                mSav = tier2 - tier1a;
                sav = 1;
                break;
            }else if (hrs<=25 && hrs>15 && tier2a>tier3){
                mSav = tier2a - tier3;
                sav = 3;
                break;    
            }else if (tier2b>tier3 && hrs>25){
                mSav = tier2b - tier3;
                sav = 3;
                break;
            }else {
                sav = 0;
            }break;
        case 3:  //package 3
            if (hrs<=5){
                mSav = tier3-tier1;
                sav = 1;
                break;
            }else if (hrs>5 && hrs<=15 && tier2>tier1a){
                mSav = tier3 - tier1a;
                sav = 1;
                break;
            }else if (tier1a>tier2 && hrs>5 && hrs<=15 ){
                mSav =tier3-tier2;
                sav = 2;
                 break;
            }else if(tier3 > tier2a && hrs>15 && hrs<=25){
                mSav = tier3 - tier2a;
                sav = 2;
                 break;
            }else{
                sav = 0;
            }break;}
                
    //Output the monthly charge 
    cout<<"\nYour current monthly bill is $"<<mCost<<"\n";
    
    //Output monthly savings if user could save money switching to new package
    cout<<fixed<<showpoint<<setprecision(2);
    
    if (sav == 1){
        cout<<"You can save an additional $"<<mSav<<" if you switch "
                "to the Tier 1 package \n\n\n" ;
    }else if (sav == 2){
        cout<<"You can save an additional $"<<mSav<<" if you switch "
                "to the Tier 2 package \n\n\n";
    }else if (sav == 3){
        cout<<"You can save an additional $"<<mSav<<" if you switch "
                "to the Tier 3 package \n\n\n" ;
    }else{
        cout<<"No savings can be made, you are paying for the right tier\n\n\n";
    }

}

float getMonthlycharge(int choice,int hrs){
    float mCost;
    //Set tier pricing
    float tier1=16.85;
    float tier2=23.85;
    float tier3=29.55;
    //Pricing for over charges 
    float tier1a=(tier1+((hrs-5)*0.8));
    float tier1b=(tier1+(1*(hrs-20)+12));
    float tier2a=(tier2+((hrs-15)*0.65));
    float tier2b=(tier2+(0.7*(hrs-25))+6.5);
    //create if else statement to determine which tier should be applied
    if (choice == 1){
        if (hrs<=5)mCost=tier1;
        else if(hrs>5 && hrs<=20)mCost=tier1a;
        else if(hrs>20)mCost=tier1b;
    }else if (choice == 2){
        if (hrs<=15)mCost=tier2;
        else if(hrs>15 && hrs<=25)mCost=tier2a;
        else if(hrs>25)mCost=tier2b;
    }else if (choice == 3){
        mCost=tier3;
    }
    //Exist stage return monthly cost
    return mCost;

}
