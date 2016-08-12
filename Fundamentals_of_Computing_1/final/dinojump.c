#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "gfx5.h"


struct Dino {
	int yVelocity; //how fast the t-rex jumps
	int vCounter; //tracks how long the t-rex has been moving in a direction
	int xcenter; //x-coordinate of the center of the center of t-rex
	int ycenter; //y-coordinate of the center of the t-rex
} dinos;

struct Cactus {
	int xVelocity; //how fast the cactus comes across the screen
	int xcenter; //x-coordinate of the center of the cactus
	int ycenter; //y-coordinate of the center of the cactus
} cacti;

void dinojump();
void draw_dino(struct Dino);
void draw_cactus(struct Cactus);
int dino_collision(struct Dino,struct Cactus);
char *num2str(int n);

void dinojump()
{
	int xsize = 800; // size of window in the x direction
	int ysize = 600; // size of window in the y direction
	int score = 0; //tracks the player's score
	char c; //characters for keyboard input 
	gfx_clear_color(224,224,224);
	gfx_clear();
	
	int playing=1;
	int cont=0;
	
	//initializes the dinosaur
	struct Dino dino;
    dino.yVelocity = 0;
    dino.vCounter = 0;
    dino.xcenter = 40;
    dino.ycenter = 530;
    
    struct Cactus cactus;
    cactus.xVelocity = -6;
    cactus.xcenter = 584;
    cactus.ycenter = 528;

	while(playing)
	{
		gfx_clear();
        
        gfx_color(0,0,0);	
        gfx_line(0,550,800,550);
		gfx_text(700,50,num2str(score));
        
        //checks if the user has pressed a key (executed a jump)
        if (gfx_event_waiting())
        {
            c = gfx_wait();
            if (c == 32 && dino.yVelocity == 0) //only allows a jump if one is not already in progress
            {
                dino.yVelocity = -10;
            }
        }
        
        //moves the dinosaur up/down if it is in the process of a jump
        if (dino.yVelocity != 0)
        {
            dino.ycenter += dino.yVelocity;
            dino.vCounter ++;
            if (dino.vCounter == 15) dino.yVelocity *= -1;
            if (dino.vCounter ==30)
            {
                dino.vCounter = 0;
                dino.yVelocity = 0;
            }
        }
        
        //moves the cactus back to its starting position if it moves off the screen
        if (cactus.xcenter <= -16)
        {
           cactus.xcenter = 615;
        }
        
        //moves the cactus normally to the left
        cactus.xcenter += cactus.xVelocity;
        
        //draws the dinosaur and the cactus
        draw_dino(dino);
        draw_cactus(cactus);
		gfx_flush();
		
		//detects if the cactus and dinosaur have collided
		if(dino_collision(dino,cactus))
		{
			gfx_color(0,0,0);
		    gfx_text(380,100,"GAME OVER");
			gfx_text(350,200,"SPACE TO PLAY AGAIN");
			gfx_text(380,250,"Q TO EXIT");
			gfx_flush();
			cont = 0;
			while (cont == 0)
			{
				switch (gfx_wait())
				{
					case 32:
						cont = 1;
						cactus.xcenter = 615;
						score = 0;
						break;
					case 'q':
						cont = 1;
						playing = 0;
						break;
					default:
						cont = 0;
				}
			}
		}
		score++;
		usleep(20000);
	}
	
}

void draw_dino(struct Dino dino)
{
	//draws an instance of the dinosaur
	int x;
	int y;
	
	x=dino.xcenter;
	y=dino.ycenter;
    
    gfx_color(130,130,130);
	gfx_fill_rectangle(x-16,y-4,28,8);
	gfx_fill_rectangle(x-8,y+4,16,6);
	gfx_fill_rectangle(x+4,y-20,8,16); //draws larger blocks within the dinosaur
	gfx_fill_rectangle(x+12,y-26,12,10);
	gfx_fill_rectangle(x-4,y-8,8,4);
	gfx_fill_rectangle(x-6,y+10,4,6);
	gfx_fill_rectangle(x+6,y-26,6,4);
	gfx_fill_rectangle(x+12,y-14,10,2);
	gfx_fill_rectangle(x+24,y-24,2,8);
	gfx_fill_rectangle(x-12,y+4,4,4);
	gfx_fill_rectangle(x-2,y+10,8,2);
	gfx_fill_rectangle(x+4,y+12,6,2);
	gfx_fill_rectangle(x-16,y-8,4,4);
	gfx_fill_rectangle(x-6,y+16,1,1);
	gfx_fill_rectangle(x-6,y+18,1,1);
	gfx_fill_rectangle(x-4,y+18,1,1);
	gfx_fill_rectangle(x-16,y-10,1,1);
	gfx_fill_rectangle(x-16,y-12,1,1);
	gfx_fill_rectangle(x+6,y-22,1,1);
		
}

void draw_cactus(struct Cactus cactus)
{
    //draws an instance of the cactus
    int x;
    int y;
    x=cactus.xcenter;
    y=cactus.ycenter;
    gfx_color(0,175,0);
    gfx_fill_rectangle(x-4,y-18,8,40);
    gfx_fill_rectangle(x+4,y-2,6,6);
    gfx_fill_rectangle(x+8,y-14,6,12);
    gfx_fill_rectangle(x-10,y-6,6,8);
    gfx_fill_rectangle(x-14,y-16,8,10);
    gfx_fill_rectangle(x-2,y-20,4,2);
    gfx_fill_rectangle(x-14,y-6,4,4);
    gfx_fill_rectangle(x-12,y-2,2,2);
    gfx_fill_rectangle(x-12,y-18,4,2);
    gfx_fill_rectangle(x+10,y-16,2,2);
    gfx_fill_rectangle(x+10,y-2,4,2);
    gfx_fill_rectangle(x+10,y,2,2);
    
}

int dino_collision(struct Dino dino,struct Cactus cactus)
{
   //detects if the dinosaur had made contact with the cactus
   int dx = dino.xcenter + 16;
   int dxx = dino.xcenter -16;
   int dy = dino.ycenter + 18;
   int cx = cactus.xcenter - 14;
   int cxx = cactus.xcenter + 14;
   int cy = cactus.ycenter - 17;
   int rt = 0; //truth value for collision
   
   if (cx-dx <= 2 && cy-dy < 2 && cactus.xcenter > dino.xcenter)
   {
	   rt = 1;
   }
   if (cy-dy <= 2 && dxx > cxx && cactus.xcenter < dino.xcenter)
   {
	   rt = 1;
   }
   
   return rt;
}

char *num2str(int n)
{
	static char a[10], *p = a;
	snprintf(p,10,"%d",n);
	return p;
}