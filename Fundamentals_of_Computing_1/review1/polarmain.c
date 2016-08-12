#include <stdio.h>
#include "polarfn.h"

int main(void){
	double x,y;
	printf("Enter X and Y coordinates in the Cartesian plane:\n");
	scanf("%lf%lf",&x,&y);
	printf("The coordinates of the point are (%lf,%lf)\n",polar_rad(x,y),polar_ang(x,y));
	printf("The point is located ");
	quadrant(x,y);
	printf("\n");
}