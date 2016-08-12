#include <math.h>

int polar_info(double x, double y, double *r, double *t){
	*r = (sqrt((x*x)+(y*y)));
	*t = (atan(y/x));
	if (x > 0 && y > 0){
		return 1;
	}
	else if (x < 0 && y > 0){
		return 2;
	}
	else if (x < 0 && y < 0){
		return 3;
	}
	else if (x > 0 && y < 0){
		return 4;
	}
	else if (!x && y > 0){
		return -2;
	}
	else if (!x && y < 0){
		return -2;
	}
	else if (x > 0 && !y){
		return -1;
	}
	else if (x < 0 && !y){
		return -1;
	}
	else if (!x && !y){
		return 0;
	}
}