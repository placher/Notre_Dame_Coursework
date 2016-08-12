#include <stdio.h>
#include <stdlib.h>
int domath(char z){
	double x,y;
	printf("Please enter two numbers on which to perform the calculation:\n");
	scanf("%lf%lf",&x,&y);
	switch(z){
		case '+':
		printf("The sum of the two numbers is %lf\n",(x+y));
		break;
		case '-':
			printf("The difference between the two numbers is %lf\n",(x-y));
			break;
		case '*':
			printf("The product of the two numbers is %lf\n",(x*y));
			break;
		case '%':
			printf("The quotient of the two numbers is %lf\n",(x/y));
			break;
	}
}

int main(){
	int go = 1;
	char z;
	while (go){
		printf("\nPlease enter (+) to add, (-) to subtract, (*) to multiply, (%) to divide, or (x) to exit:  \n");
		z = getchar();
		getchar();
		if(z == 'x'){
			exit(1);
		}
		else {
			domath(z);
		}
	}
}