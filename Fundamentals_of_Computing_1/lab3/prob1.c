#include <stdio.h>

int getgcd(int a,int b){
	//getgcd function obtained from www.math.wustl.edu/~victor/mfmm/compaa/gcd.c
	int c;
	while (a != 0){
		c = a;
		a = b%a;
		b = c;
	}
	return b;
}

int main(void){
	int a,b;
	printf("Enter two integers:\n");
	scanf("%d%d",&a,&b);
	printf("\n");
	printf("Greatest Comon Divisor is %d\n",getgcd(a,b));
}
