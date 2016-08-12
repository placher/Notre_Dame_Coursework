#include "gfx.h"
#include <math.h>

int polygon(int sides);

int main(void){
	gfx_open(1000,1000,"Symbol.C");
	int xpos,ypos,cont=1;
	while (cont){
		switch (gfx_wait()){
			case 1: //blue box
				xpos = gfx_xpos();
				ypos = gfx_ypos();
				gfx_color(0,35,102);
				gfx_line(xpos+50,ypos+50,xpos+50,ypos-50);
				gfx_line(xpos-50,ypos+50,xpos-50,ypos-50);
				gfx_line(xpos+50,ypos+50,xpos-50,ypos+50);
				gfx_line(xpos+50,ypos-50,xpos-50,ypos-50);
				break;
			case 't': //green triangle
				xpos = gfx_xpos();
				ypos = gfx_ypos();
				gfx_color(0,200,100);
				gfx_line(xpos,ypos,xpos,ypos+50);
				gfx_line(xpos,ypos,xpos+50,ypos);
				gfx_line(xpos+50,ypos,xpos,ypos+50);
				break;
			case 'c': //white circle
				xpos = gfx_xpos();
				ypos = gfx_ypos();
				gfx_color(255,255,255);
				gfx_circle(xpos,ypos,50);
				break;
			//regular polygons with "n" sides
			case '3':
				polygon(3);
				break;
			case '4':
				polygon(4);
				break;
			case '5':
				polygon(5);
				break;
			case '6':
				polygon(6);
				break;
			case '7':
				polygon(7);
				break;
			case '8':
				polygon(8);
				break;
			case '9':
				polygon(9);
				break;
			case 'q':
				cont = 0;
				break;
		}
	}
	gfx_clear();
}

int polygon(int sides){
	double circle=(2*3.14159265358979323846);
	double angle=(circle/sides);
	int i,xpos,ypos;
	xpos = gfx_xpos();
	ypos = gfx_ypos();
	gfx_color(186,85,211);
	for (i=1;i<(sides+1);i++){
		gfx_line((xpos+(50*cos(i*angle))),(ypos+(50*sin(i*angle))),(xpos+(50*cos((i+1)*angle))),(ypos+(50*sin((i+1)*angle))));
	}
}