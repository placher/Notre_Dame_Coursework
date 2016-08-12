#include "gfx.h"
#include <unistd.h>
#include <math.h>

double pi = 3.14159265358979323846;
double armangle = 1.5,darmangle = 0.05,xarmpos,yarmpos,rad = 0.96, drad = -0.02,xbox,ybox;
int yline = 400, dyline = 5, xslider = 400, dxslider = 10;

int carnival();
int slider();
int looparm();
int armbox();
int rider();

int main(){
	//gcc won't allow variables to be defined in terms of other variables, so these are completed here
	armangle *= pi;
	darmangle *= pi;
	
	gfx_open(800,800,"Carnival.c");
	int cont = 1,dt = 125000;
	char c;
	while (cont){
		gfx_clear();
		carnival();
		gfx_flush();
		if (gfx_event_waiting()){
			c = gfx_wait();
		}
		if (c == 'q'){
			cont = 0;
		}
		usleep(dt);
	}
}

int carnival(){
	gfx_color(90,251,198);
	gfx_line(180,yline,620,yline);
	yline += dyline;
	if (yline >= 550){
		dyline *= -1;
	}
	if (yline <= 250){
		dyline *= -1;
	}
	slider();
}

int slider(){
	gfx_color(255,38,38);
	gfx_circle(xslider,yline-dyline,40);
	xslider += dxslider;
	if (xslider >=600){
		dxslider *= -1;
	}
	if (xslider <= 200){
		dxslider *= -1;
	}
	looparm();
}

int looparm(){
	gfx_color(150,123,182);
	xarmpos = ((200*cos(armangle))+xslider-dxslider);
	yarmpos = ((200*sin(armangle))+yline-dyline);
	gfx_line(xslider-dxslider,yline-dyline,xarmpos,yarmpos);
	armangle += darmangle;
	armbox();
}

int armbox(){
	gfx_color(170,224,9);
	xbox = (rad*(200*cos(armangle-darmangle))+xslider-dxslider);
	ybox = (rad*(200*sin(armangle-darmangle))+yline-dyline);
	gfx_line(xbox+30,ybox-30,xbox+30,ybox+30);
	gfx_line(xbox-30,ybox-30,xbox-30,ybox+30);
	gfx_line(xbox+30,ybox-30,xbox-30,ybox-30);
	gfx_line(xbox+30,ybox+30,xbox-30,ybox+30);
	rad += drad;
	if (rad <= 0.5){
		drad *= -1;
	}
	if (rad >= 0.98){
		drad *= -1;
	}
	rider();
}

int rider(){
	gfx_color(255,240,122);
	gfx_circle(xbox,ybox-15,10);
	gfx_line(xbox,ybox-5,xbox,ybox+10);
	gfx_line(xbox-10,ybox,xbox+10,ybox);
	gfx_line(xbox,ybox+10,xbox-10,ybox+25);
	gfx_line(xbox,ybox+10,xbox+10,ybox+25);
}