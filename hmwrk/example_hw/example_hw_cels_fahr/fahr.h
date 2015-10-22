/* 
 * File:   fahr.h
 * Author: Amul.bham
 *
 * Created on October 22, 2015, 4:28 PM
 */

#ifndef FAHR_H
#define	FAHR_H
void problem2(unsigned int,unsigned int);

void problem2(unsigned int R0,unsigned int R1){
    int R2 = 0;
    int R3 = R0;
    int R4 = 0;
    printf("Display Degree Centigrade to Degree Fahrenheit\n");
    printf("Centigrade     Fahrenheit  \n");
    _loop1: 
    R2 = (R3-32);
    R4 =0x8E38E;
    R4*=R2;
    R4>>=20;
    cout<<"  "<<R4<<"           "<<R3<<endl;
    R3++;
    if (R3<=R1)  goto _loop1;
}


#endif	/* FAHR_H */

