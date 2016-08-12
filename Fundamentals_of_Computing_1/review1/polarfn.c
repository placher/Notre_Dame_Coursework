#include <stdio.h>
#include <math.h>

//calculates polar radius
double polar_rad(double x,double y){
	return (sqrt((x*x)+(y*y)));
}
//calculates polar angle
double polar_ang(double x,double y){
	return (atan(y/x));
}
//determine where a point lies in the coordinate plane (quadrant/axis/origin)
int quadrant(double x,double y){
	if (x > 0 && y > 0){
		printf("in quadrant 1");
	}
	else if (x < 0 && y > 0){
		printf("in quadrant 2");
	}
	else if (x < 0 && y < 0){
		printf("in quadrant 3");
	}
	else if (x > 0 && y < 0){
		printf("in quadrant 4");
	}
	else if (!x && y > 0){
		printf("on the positive Y axis");
	}
	else if (!x && y < 0){
		printf("on the negative Y axis");
	}
	else if (x > 0 && !y){
		printf("on the positive X axis");
	}
	else if (x < 0 && !y){
		printf("on the negative X axis");
	}
	else if (!x && !y){
		printf("at the origin");
	}
}