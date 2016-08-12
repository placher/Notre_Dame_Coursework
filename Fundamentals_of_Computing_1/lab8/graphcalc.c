#include "gfx.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

double pi=3.14159265358979323846;

int draw_axes();
int graph_taylor(int terms);
int graph_sin();
int print_key(int terms);

int main(void){
	gfx_open(1000,1000,"Taylor Expansion of Sin(X)");
	int cont = 1,terms=1;
	char c;
	while (cont){
		gfx_clear();
		draw_axes();
		graph_sin();
		graph_taylor(terms);
		print_key(terms);
		c = gfx_wait();
		if (c == 'q'){
			cont = 0;
		}
		if (c == '='){
			terms ++;
		}
	}
}

int draw_axes(){
	gfx_color(255,255,255);
	gfx_line(500,0,500,1000);
	gfx_line(0,500,1000,500);
	int i,j=-10;
	char c[2]={'\0'};
	for (i=0;i<1001;i+=50){
		sprintf(c,"%d",j);
		gfx_line(495,i,505,i);
		gfx_line(i,495,i,505);
		if (j != 0){
			gfx_text(506,i,c);
			gfx_text(i,520,c);
		}
		j++;
	}
	gfx_flush();
}

int graph_taylor(int terms){
	double x,y,x0,y0,k;
	int nterms=terms,i,j,l;
	gfx_color(67,222,47);
	for (x=-10;x<10.02;x+=0.02){
		y = 0;
		j = 1;
		for (i=1;i<=nterms;i++){
			if (i != 1){
				j += 2;
			}
			l = j;
			if ((i % 2) != 0){
				k = 1;
				while (l >= 1){
					k *= (x/l);
					l--;
				}
				y += k;
			}
			else {
				k = 1;
				while (l >= 1){
					k *= (x/l);
					l--;
				}
				y -= k;
			}
		}
		y *= -1;
		if (x == -10.0){
			x0 = x;
			y0 = y;
		}
		else {
			gfx_line((int)((x0+10)*50),(int)(50*y0+500),(int)((x+10)*50),(int)(50*y+500));
			x0 = x;
			y0 = y;
		}
	}
}

int graph_sin(){
	double x,y,x0,y0;
	gfx_color(240,166,38);
	for (x=-10;x<10.02;x+=0.02){
		y = -1*sin(x);
		if (x == -10.0){
			x0 = x;
			y0 = y;
		}
		else {
			gfx_line((int)((x0+10)*50),(int)(50*y0+500),(int)((x+10)*50),(int)(50*y+500));
			x0 = x;
			y0 = y;
		}
	}
}

int print_key(int terms){
	char c[2] = {'\0'};
	sprintf(c,"%d",terms);
	gfx_color(240,166,38);
	gfx_text(100,25,"Graph of Sin(X)");
	gfx_color(67,222,47);
	gfx_text(100,50,"Taylor Series Expression- Terms:");
	gfx_text(300,50,c);
}