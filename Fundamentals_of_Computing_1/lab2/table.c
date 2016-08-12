#include <stdio.h>

int main (void) {
	//initializes the variables for table size as integers
	int xsize;
	int ysize;
	//takes the necessary sizes of the table from the user
	printf("Enter size of the table's X axis: ");
	scanf("%d", &xsize);
	printf("Enter size of the table's Y axis: ");
	scanf("%d", &ysize);
	//prints the integers along the X axis
	int xstep = 1;
	printf("     *");
	while(xstep <= xsize) {
		printf("%6d", xstep);
		xstep += 1;
	}
	//prints the multiplication table
	int ystep = 1;
	while(ystep <= ysize){
		printf("\n%6d", ystep);
		xstep = 1;
		while(xstep <= xsize) {
			printf("%6d", (xstep*ystep));
			xstep += 1;
		}
		ystep += 1;
	}
	printf("\n");
}