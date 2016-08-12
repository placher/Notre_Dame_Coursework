#include "gfx4.h"
#include <stdlib.h>
#include <math.h>

double pi=3.14159265358979323846;
double e=2.71828182845904523536;

//RECURSIVE FUNCTIONS
void sierpinski(int,int,int,int,int,int);
void shrinkingsquare(int,int,int);
void spiralsquares(int,double,int);
void circlelace(int,int,int);
void snowflake(int,int,int);
void tree(int,int,int,double);
void fern(int,int,int,double,int);
void spiralofspirals(int,int,double,double,double);

//UTILITY FUNCTIONS
void drawtriangle(int,int,int,int,int,int);
void drawsquare(int,int,int);
void drawspiral(int,int,int,int,double,double);

void main(void){
	gfx_open(800,800,"Fractals Window");
	char c = 'a';
	while (c != 'q'){
		if (gfx_event_waiting()){
			gfx_clear();
			c = gfx_wait();
		}
		switch (c){
			case '1':
				sierpinski(100,700,700,700,400,100);
				break;
			case '2':
				shrinkingsquare(400,400,150);
				break;
			case '3':
				spiralsquares(0,0,2);
				break;
			case '4':
				circlelace(400,400,200);
				break;
			case '5':
				snowflake(400,400,250);
				break;
			case '6':
				tree(400,600,100,(3*pi/2));
				break;
			case '7':
				fern(400,700,100,(3*pi/2),1);
				break;
			case '8':
				spiralofspirals(400,400,0.5,0,0.5);
				break;
		}
	}	
}

//RECURSIVE FUNCTIONS
void sierpinski(int x1,int y1,int x2,int y2,int x3,int y3)
{
	//Base case 
	if (abs(x2-x1) < 2) return;
	//Draw the triangle
	drawtriangle( x1, y1, x2, y2, x3, y3 );
	//Recursive calls
	sierpinski( x1, y1, (x1+x2)/2, (y1+y2)/2, (x1+x3)/2, (y1+y3)/2 );
	sierpinski( (x1+x2)/2, (y1+y2)/2, x2, y2, (x2+x3)/2, (y2+y3)/2 );
	sierpinski( (x1+x3)/2, (y1+y3)/2, (x2+x3)/2, (y2+y3)/2, x3, y3 );
}

void shrinkingsquare(int centerx,int centery,int radius){
	//Base case
	if (abs(radius/2) < 2) return;
	//Draw the squares
	drawsquare(centerx,centery,radius);
	//Recursive calls
	shrinkingsquare(centerx+radius,centery+radius,radius/2);
	shrinkingsquare(centerx+radius,centery-radius,radius/2);
	shrinkingsquare(centerx-radius,centery+radius,radius/2);
	shrinkingsquare(centerx-radius,centery-radius,radius/2);
}

void spiralsquares(int radius,double angle, int sqrad){
	//Base Case
	if ((radius*cos(angle)+400) > 800) return;
	//Draw the square
	drawsquare((int)((radius*cos(angle))+400),(int)((radius*sin(angle))+400),sqrad);
	//Recursive call
	spiralsquares(radius+15,(angle+(pi/6)),sqrad+2);
}

void circlelace(int xcord, int ycord, int radius){
	//Base Case
	if (radius < 2) return;
	//Draw Circles
	gfx_circle(xcord,ycord,radius);
	gfx_flush();
	//Recursive Calls
	circlelace((int)((radius*cos(pi/3))+xcord),(int)((radius*sin(pi/3))+ycord),(radius/3));
	circlelace((int)((radius*cos((2*pi)/3))+xcord),(int)((radius*sin((2*pi)/3))+ycord),(radius/3));
	circlelace((int)((radius*cos(pi))+xcord),(int)((radius*sin(pi))+ycord),(radius/3));
	circlelace((int)((radius*cos((4*pi)/3))+xcord),(int)((radius*sin((4*pi)/3))+ycord),(radius/3));
	circlelace((int)((radius*cos((5*pi)/3))+xcord),(int)((radius*sin((5*pi)/3))+ycord),(radius/3));
	circlelace((int)((radius*cos(2*pi))+xcord),(int)((radius*sin(2*pi))+ycord),(radius/3));
}

void snowflake(int xcord,int ycord,int radius){
	//Base Case
	if (radius < 2) return;
	//Draw Lines
	gfx_line(xcord,ycord,(int)((radius*cos(pi/3))+xcord),(int)((radius*sin(pi/3))+ycord));
	gfx_line(xcord,ycord,(int)((radius*cos(2*pi/3))+xcord),(int)((radius*sin(2*pi/3))+ycord));
	gfx_line(xcord,ycord,(int)((radius*cos(pi))+xcord),(int)((radius*sin(pi))+ycord));
	gfx_line(xcord,ycord,(int)((radius*cos(4*pi/3))+xcord),(int)((radius*sin(4*pi/3))+ycord));
	gfx_line(xcord,ycord,(int)((radius*cos(5*pi/3))+xcord),(int)((radius*sin(5*pi/3))+ycord));
	gfx_line(xcord,ycord,(int)((radius*cos(2*pi))+xcord),(int)((radius*sin(2*pi))+ycord));
	gfx_flush();
	//Recursive Calls
	snowflake((int)((radius*cos(pi/3))+xcord),(int)((radius*sin(pi/3))+ycord),radius/3);
	snowflake((int)((radius*cos(2*pi/3))+xcord),(int)((radius*sin(2*pi/3))+ycord),radius/3);
	snowflake((int)((radius*cos(pi))+xcord),(int)((radius*sin(pi))+ycord),radius/3);
	snowflake((int)((radius*cos(4*pi/3))+xcord),(int)((radius*sin(4*pi/3))+ycord),radius/3);
	snowflake((int)((radius*cos(5*pi/3))+xcord),(int)((radius*sin(5*pi/3))+ycord),radius/3);
	snowflake((int)((radius*cos(2*pi))+xcord),(int)((radius*sin(2*pi))+ycord),radius/3);
}

void tree(int xcord,int ycord,int radius,double angle){
	//Base Case
	if (radius < 1) return;
	//Draw Lines
	gfx_line(400,800,400,800-2*radius);
	gfx_line(xcord,ycord,(int)(xcord-(radius*cos(angle+(pi/4)))),(int)((ycord-radius)+(radius*sin(angle+(pi/4)))));
	gfx_line(xcord,ycord,(int)(xcord-(radius*cos(angle-(pi/4)))),(int)((ycord-radius)+(radius*sin(angle-(pi/4)))));
	gfx_flush();
	//Recursive Calls
	tree((int)(xcord-(radius*cos(angle+(pi/4)))),(int)((ycord-radius)+(radius*sin(angle+(pi/4)))),radius/1.5,(angle+(pi/4)));
	tree((int)(xcord-(radius*cos(angle-(pi/4)))),(int)((ycord-radius)+(radius*sin(angle-(pi/4)))),radius/1.5,(angle-(pi/4)));
}

void fern(int xcord,int ycord,int radius,double angle,int counter){
	//Base Case
	if (radius < 6) return;
	if (counter > 4) return;
	//Draw Lines
	gfx_line(400,800,400,700);
	gfx_line(xcord,ycord,(int)(xcord-radius*cos(angle)),(int)((ycord-radius)+(radius*sin(angle))));
	gfx_line(xcord,ycord,(int)(xcord-radius*cos(angle+(pi/4))),(int)((ycord-radius)+(radius*sin(angle+(pi/4)))));
	gfx_line(xcord,ycord,(int)(xcord-(radius*cos(angle-(pi/4)))),(int)((ycord-radius)+(radius*sin(angle-(pi/4)))));
	gfx_flush();
	//Recursive Calls
	fern(xcord,ycord-2*radius,radius,angle,counter+1);
	fern((int)(xcord-radius*cos(angle+(pi/4))),(int)((ycord-radius)+(radius*sin(angle+(pi/4)))),radius/2,angle+(pi/4),1);
	fern((int)(xcord-radius*cos(angle-(pi/4))),(int)((ycord-radius)+(radius*sin(angle-(pi/4)))),radius/2,angle-(pi/4),1);
}

void spiralofspirals(int xpos,int ypos,double a,double angle,double maxrad){
	//Base Case
	if (xpos < 0 || xpos > 800) return;
	//Draw Lines
	drawspiral((int)(400+(a*cos(angle)*pow(e,(0.15*angle)))),(int)(400+(a*sin(angle)*pow(e,(0.15*angle)))),(int)(400+(a*cos(angle)*pow(e,(0.15*angle)))),(int)(400+(a*sin(angle)*pow(e,(0.15*angle)))),0,maxrad);
	//Recursive Call
	spiralofspirals((int)(400+(a*cos(angle)*pow(e,(0.15*angle)))),(int)(400+(a*sin(angle)*pow(e,(0.15*angle)))),a,angle+(pi/6),maxrad+1);
}

//UTILITY FUNCTIONS
void drawtriangle(int x1,int y1,int x2,int y2,int x3,int y3){
	gfx_line(x1,y1,x2,y2);
	gfx_line(x2,y2,x3,y3);
	gfx_line(x3,y3,x1,y1);
	gfx_flush();
}

void drawsquare(int centerx,int centery,int radius){
	gfx_line(centerx+radius,centery+radius,centerx+radius,centery-radius);
	gfx_line(centerx-radius,centery+radius,centerx-radius,centery-radius);
	gfx_line(centerx+radius,centery+radius,centerx-radius,centery+radius);
	gfx_line(centerx+radius,centery-radius,centerx-radius,centery-radius);
	gfx_flush();
}

void drawspiral(int xpos,int ypos,int xpos0,int ypos0,double angle,double maxrad){
	//Base Case
	if ((0.125*pow(e,(0.05*angle))) > maxrad) return;
	//Draw Line
	gfx_line(xpos,ypos,(int)(xpos0+(0.125*pow(e,(0.05*angle))*cos(angle))),(int)(ypos0+(0.125*pow(e,(0.05*angle))*sin(angle))));
	gfx_flush();
	//Recursive Call
	drawspiral((int)(xpos0+(0.125*pow(e,(0.05*angle))*cos(angle))),(int)(ypos0+(0.125*pow(e,(0.05*angle))*sin(angle))),xpos0,ypos0,angle+(pi/6),maxrad);
}