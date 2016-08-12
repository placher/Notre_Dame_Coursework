#include "gfx.h"
#include <unistd.h>
#include <stdlib.h>

int main(void){
	gfx_open(500,500,"Bounce.C");
	int deltat=10000,xpos=250,ypos=250,dx=(rand()%10),dy=(rand()%10);
	gfx_color(255,255,255);
	gfx_circle(xpos,ypos,25);
	while (1){
		xpos += dx;
		ypos += dy;
		if (xpos > 475){
			xpos = 475;
			dx = -dx;
		}
		if (xpos < 25){
			xpos = 25;
			dx = -dx;
		}
		if (ypos > 475){
			ypos = 475;
			dy = -dy;
		}
		if (ypos < 25){
			ypos = 25;
			dy = -dy;
		}
		gfx_clear();
		gfx_circle(xpos,ypos,25);
		usleep(deltat);
		if (gfx_event_waiting()){
			if (gfx_wait() == 1){
				xpos = gfx_xpos();
				ypos = gfx_ypos();
				gfx_clear();
				gfx_circle(xpos,ypos,25);
				dx=(rand()%10);
				dy=(rand()%10);
			}
		}
	}
}