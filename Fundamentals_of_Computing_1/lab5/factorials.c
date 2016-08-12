#include <stdio.h>
#include <string.h>

//The upper bound for this loop is the highest place where 9!*n is a number of length of n. This occurs at 9!*7 because 9!*8
//is also a 7-digit number. Therefore the upper bound of the problem is 9!*7 = 2540160. We can also exclude 1-digit numbers,
//as the only candidates returning 1-digit factorials are 1! and 2!, but they are not sums, and are therefore excluded. By
//this definition, we have constrained the possible domain to 10<x<2540160, significantly limiting the number of integers we 
//must test.

int factorial(int n);

int main(void){
	char num[7] = {'\0'};
	int answers[100],anscount=0,i,j;
	for (i=10;i<=2540160;i++){
		sprintf(num,"%d",i);
		for (j=0,j<7,j++){
			
		}
	}
}

int factorial(int n){
	int f=1;
	while (n != 0){
		f = f*n;
		n--;
	}
	return f;
}