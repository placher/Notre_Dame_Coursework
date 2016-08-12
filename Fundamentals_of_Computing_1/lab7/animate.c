#include "gfx.h"
#include <math.h>
#include <unistd.h>

double pi=3.14159265358979323846;

int draw_wheel(double rotation);

// pressing the ( = ) key will increase the clockwise rotation of the ferris wheel
// pressing the ( - ) key will increase the counter-clockwise rotation of the ferris wheel

int main(void){
	gfx_open(1000,1000,"Ferris Wheel");
	double angle=0,delta=(pi/100);
	int dt=100000;
	char c;
	while (1){
		draw_wheel(angle);
		angle += delta;
		if (gfx_event_waiting()){
			c = gfx_wait();
			if (c == '='){
				delta += (pi/100);
			}
			if (c == '-'){
				delta -= (pi/100);
			}
		}
		usleep(dt);
	}
}

int draw_wheel(double rotation){
	gfx_clear();
	gfx_color(250,250,250);
	gfx_circle(500,500,250);
	int i;
	for (i=0;i<6;i++){
		gfx_color(0,200,100);
		gfx_line((int)((250*cos((i*pi/3)+rotation))+520),(int)((250*sin((i*pi/3)+rotation))+480),(int)((250*cos((i*pi/3)+rotation))+480),(int)((250*sin((i*pi/3)+rotation))+480));
		gfx_line((int)((250*cos((i*pi/3)+rotation))+520),(int)((250*sin((i*pi/3)+rotation))+520),(int)((250*cos((i*pi/3)+rotation))+480),(int)((250*sin((i*pi/3)+rotation))+520));
		gfx_line((int)((250*cos((i*pi/3)+rotation))+480),(int)((250*sin((i*pi/3)+rotation))+520),(int)((250*cos((i*pi/3)+rotation))+480),(int)((250*sin((i*pi/3)+rotation))+480));
		gfx_line((int)((250*cos((i*pi/3)+rotation))+520),(int)((250*sin((i*pi/3)+rotation))+520),(int)((250*cos((i*pi/3)+rotation))+520),(int)((250*sin((i*pi/3)+rotation))+480));
		gfx_color(255,255,255);
		gfx_line(500,500,(int)((250*cos((i*pi/3)+rotation))+500),(int)((250*sin((i*pi/3)+rotation))+500));
	}
	gfx_flush();
}