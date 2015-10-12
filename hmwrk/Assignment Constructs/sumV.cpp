//Libraries
#include <iostream>
#include <cstdlib>

using namespace std;

//Execution begins here
int main(int argc, char *argv[])
{
    int sum =0;
    
    //For assembly
    sum = 1+2+3+4+5+6+7+8+9+10;
    
    /*Using counter
    for(int i=1; i<=10; i++){
            sum = i + sum;
            }
    */
    
    //Output
    cout<<"The sum of 1 to 10 is "<<sum<<endl;

    
//Exit stage right
    system("PAUSE");
    return EXIT_SUCCESS;
}