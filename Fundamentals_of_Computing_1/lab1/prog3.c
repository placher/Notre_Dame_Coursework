#include <stdio.h>
#include <math.h>

int main ()
{
	printf("This program solves quadratic equations of the formula ax^2 + bx + c\n");
    float a = 1.0;
    float b = 1.0;
    float c = 1.0;
    printf("Enter coefficient of x^2 (a): \n");
	scanf("%f", &a);
	if (a == 0) 
	{
		printf("Sorry, a cannot be 0");
		return 0;
	}
	printf("Enter coefficient of x (b): \n");
	scanf("%f", &b);
	printf("Enter constant value (c): \n");
	scanf("%f", &c);
	
	float x1;
	float x2;
	
	x1 = (0-b + sqrt((b*b)-(4*a*c))) / (2*a);
	x2 = (0-b - sqrt((b*b)-(4*a*c))) / (2*a);
	
	printf("The roots of the quadratic equation %f x^2 + %f x + %f are \n",a,b,c);
	printf("%f and %f \n",x1,x2);
	return 0;
	}
