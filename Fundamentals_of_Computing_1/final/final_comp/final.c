//final.c 
//Game main menu and execution.
//AUTHORS: James Marvin, J. Patrick Lacher (jmarvin1,jlacher1)

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "gfx5.h"
#include "hellafunctions.h"

void main()
{
	gfx_open(800,800,"What We Really Want to Do in Discrete Math");
	int cont = 1,p,x,y;
	while (cont)
	{
		draw_main_screen();
		p= 'a';
		p = gfx_wait();
		if (p == 1)
		{
			x = gfx_xpos();
			y = gfx_ypos();
			if (x >= 50 && x <= 250 && y >= 200 && y <= 400) pong();
			if (x >= 300 && x <= 500 && y >= 200 && y <= 400) minesweeper();
			if (x >= 550 && x <= 750 && y >= 200 && y <= 400) dinojump();
			if (x >= 300 && x <= 600 && y >= 600 && y <= 700) cont = 0;
		}
	}
}