/* 
 * File:   cels.h
 * Author: Amul.bham
 *
 * Created on October 22, 2015, 4:18 PM
 */

#ifndef CELS_H
#define	CELS_H

void problem1(unsigned int,unsigned int);


void problem1(unsigned int R0,unsigned int R1){
    
    unsigned int R2 = R0;
    unsigned int R4 = 0x1CD;
    
    printf("Display Degree Centigrade to Degree Fahrenheit\n");
    printf("Fahrenheit  Centigrade\n");
    _loop: 
    R4 = 0x1CD;
    R4*=R2;
    R4>>=8;
    R4+=32;
    cout<<"  "<<R4<<"         "<<R2<<endl;
    R2++;
    if (R2<=R1)  goto _loop;
    
}

#endif	/* CELS_H */

