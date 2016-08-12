#include <stdio.h>
#include <math.h>

int main(void){
	printf("A plot of y = 6*(sin(cos(x))) + sin(x) + 2 from x = 0 to x = 17.5\n");
	printf("\n");
	printf("X\tY\n");
	
	//initialize variables
	double x;
	double y;
	int graph_y;
	//initialize tracking variables
	double max_x;
	double max_y = 0;
	double min_x;
	double min_y = 10;
	
	//compute the graph for an X increment of 0.2
	for ( x=0; x<17.5; x+=0.2){
		y = 6*((sin(cos(x))) + sin(x) + 2);
		graph_y = rint(y);
		printf("%2.2lf\t%4.2lf\t%.*s\n",x,y,graph_y,"#####################");
		if (y > max_y){
			max_x = x;
			max_y = y;
		}
		if (y < min_y){
			min_x = x;
			min_y = y;
		}
	}
	printf("The maximum of %lf was at X = %lf\n",max_y,max_x);
	printf("The minimum of %lf was at X = %lf\n",min_y,min_x);
}