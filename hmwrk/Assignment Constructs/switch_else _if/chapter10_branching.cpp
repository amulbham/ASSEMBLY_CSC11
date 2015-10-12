/* 
 * Author: Amul Bham 
 *Purpose: Template code for conditionals in C++
 * Created on October 6, 2015, 2:44 PM
 */

//Libraries
#include <iostream>
#include <cstdlib>

using namespace std;

//Execution begins here
int main(int argc, char** argv) {

   int days;
   
   cout<<"Enter the number of day which you attend class on [1-5 for M-F]: ";
   cin>>days;
   
   switch(days){
    case 1: 
        cout<<"11"<<endl;
        break;
    case 2: 
        cout<<"5"<<endl;
    break;
    case 3: 
        cout<<"11"<<endl;
    break;
       case 4:
           cout<<"5"<<endl;
           break;
        case 5:
            cout<<"1"<<endl;
            break;
       default:
           cout<<"0"<<endl;
   }
   
/******************if-else ************************************ */
   if(days == 1){
           cout<<"11"<<endl;
           }
   else if (days == 2){
        cout << "5"<<endl;
        }
   else if (days == 3){
        cout << "11"<<endl;
        }
    else if (days == 4){
        cout << "5"<<endl;
        }       
    else if (days == 5){
        cout << "1"<<endl;
        }
   else if (days != 1 || 2 || 3 || 4 || 5){
       cout << "0"<<endl;
        }
  
//Exit stage right
    system("PAUSE");
    return 0;
}
