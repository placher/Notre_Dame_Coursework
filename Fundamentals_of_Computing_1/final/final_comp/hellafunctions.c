//hellafunctions.c
//place where we store all of our functions for the games
//Author: James Marvin, J. Patrick Lacher (jmarvin1, jlacher1)

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "gfx5.h"
#include "hellafunctions.h"

int board[16][30] = {0};

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
    
	//initializes the obstacles
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

void minesweeper()
{
	//runs the minesweeper game
	int nmines = 99,cont = 0;
	gfx_clear();
	do 
	{
	clearboard();
	placemines(nmines);
	gfx_clear_color(200,200,200);
	gfx_clear();
	buildboard();
	cont = playgame();
	} while (cont);
}

void placemines(int nmines)
{
	//initializes a filled board
	srand(time(NULL));
	int row,col,count = nmines;
	while (count != 0)
	{
		
		row = (rand()%16);
		col = (rand()%30);
		if (board[row][col] != 9)
		{
			board[row][col] = 9;
			placemarkers(row,col);
			count--;
		}
	}
	correctcount();
}

void placemarkers(int row,int col)
{
	//marks the adjacent squares on the board with the minesweeper algorithm
	if (row-1 >= 0) board[row-1][col] += 1;
	if (row+1 <= 15) board[row+1][col] += 1;
	if (col-1 >= 0) board[row][col-1] += 1;
	if (col+1 <= 29) board[row][col+1] += 1;
	if (row-1 >= 0 && col-1 >= 0) board[row-1][col-1] += 1;
	if (row-1 >= 0 && col+1 <= 29) board[row-1][col+1] += 1;
	if (row+1 <= 15 && col-1 >= 0) board[row+1][col-1] += 1;
	if (row+1 <= 15 && col+1 <= 29) board[row+1][col+1] += 1;
}

void correctcount()
{
	//corrects extraneous counts in the board
	int i,j;
	for (i=0;i<16;i++)
	{
		for (j=0;j<30;j++)
		{
			if (board[i][j] > 9) board[i][j] = 9;
		}
	}
}

void buildboard()
{
	//prints the board to gfx
	int i;
	gfx_color(75,75,75);
	for (i=20;i<=600;i+=20)
	{
		gfx_line(i,0,i,320);
	}
	for (i=20;i<=320;i+=20){
		gfx_line(0,i,600,i);
	}
	drawsmile();
	gfx_flush();
}

int playgame()
{
	//runs the minesweeper game
	int playing=1,row,col,n,rt=0;
	char result[2] = {0};
	while (playing)
	{
		n = gfx_wait();
		if (n == 1){
			row = (int)(gfx_xpos()/20);
			col = (int)(gfx_ypos()/20);
			if (row <= 29 && col <= 15)
			{
				if (board[col][row] == 9)
				{
					gfx_color(0,0,0);
					result[0] = 'X';
					gfx_color(255,0,0);
					gfx_text(20*row + 10,20*col + 13,result);
					gfx_flush();
					playing = 0;
				}
				if (board[col][row] != 9)
				{
					setnumbercolor(row,col);
					result[0] = 48+board[col][row];
					gfx_text(20*row +10,20*col + 13,result);
					gfx_flush();
				}
			}
			if (row <= 15 && row >= 14 && col >= 16 && col <= 18)
			{
				playing = 0;
				rt = 1;
			}
		}
		if (n == 3)
		{
			row = (int)(gfx_xpos()/20);
			col = (int)(gfx_ypos()/20);
			if (row <= 29 && col <= 15)
			{
				result[0] = 'F';
				gfx_color(255,100,0);
				gfx_text(20*row + 10,20*col + 13,result);
				gfx_flush();
			}
		}
	}
	usleep(100000);
	int button = 0;
	while (rt == 0)
	{
		//evaluates if the user wants to start a new game or quit
		gfx_text(250,500,"Press 'Q' to Quit");
		button = gfx_wait();
		row = (int)(gfx_xpos()/20);
		col = (int)(gfx_ypos()/20);
		if (button == 1)
		{
			if (row <= 15 && row >= 14 && col >= 16 && col <= 18)
			{
				rt = 1;
			}
		}
		if (button == 'q')
		{
			rt = 0;
			break;
		}
	}
	return rt;
}

void setnumbercolor(int row,int col)
{
	int n = board[col][row];
	switch (n)
	{
		case 0:
			gfx_color(0,0,0);
			break;
		case 1:
			gfx_color(38,15,189);
			break;
		case 2:
			gfx_color(50,150,0);
			break;
		case 3:
			gfx_color(233,5,5);
			break;
		case 4:
			gfx_color(65,5,233);
			break;
		case 5:
			gfx_color(170,10,10);
			break;
		default:
			gfx_color(0,255,255);
	}
}

void drawsmile()
{
	//draws the new game button
	gfx_color(255,255,0);
	gfx_fill_circle(300,350,16);
	gfx_color(0,0,0);
	gfx_fill_rectangle(296,360,8,2);
	gfx_fill_rectangle(294,358,2,2);
	gfx_fill_rectangle(292,356,2,2);
	gfx_fill_rectangle(304,358,2,2);
	gfx_fill_rectangle(306,356,2,2);
	
	gfx_fill_rectangle(294,342,4,4);
	gfx_fill_rectangle(302,342,4,4);
	gfx_flush();	
}

void clearboard()
{
	//resets all of the tiles on the board to 0
	int i,j;
	for(i=0;i<16;i++)
		for(j=0;j<30;j++)
		{
			board[i][j]=0;
		}
	
}

void pong()
{	
	gfx_clear();
	
	//initializes the paddles
	struct Paddle paddlel;
	paddlel.xpos = 20;
	paddlel.ypos = 200;
	paddlel.yvelocity = 0;
	
	struct Paddle paddler;
	paddler.xpos = 780;
	paddler.ypos = 200;
	paddler.yvelocity = -8;
	
	//initializes the scoreboard
	struct Score score;
	score.lscore = 0;
	score.rscore = 0;
	
	//initializes the ball
	srand(time(NULL));
	int q,scont;
	struct Ball ball;
	ball.ypos = 200;
	ball.xpos = 400;
	q = rand() % 4;
	switch (q)
	{
		case 0:
			ball.xvelocity = rand() % 10;
			ball.yvelocity = rand() % 10;
			break;
		case 1:
			ball.xvelocity = (-1)*(rand() % 10);
			ball.yvelocity = rand() % 10;
			break;
		case 2:
			ball.xvelocity = rand() % 10;
			ball.yvelocity = (-1)*(rand() % 10);
			break;
		default :
			ball.xvelocity = (-1)*(rand() % 10);
			ball.yvelocity = (-1)*(rand() % 10);
	}
	if (ball.xvelocity == 0)
	{
		ball.xvelocity = 2;
	}
	if (ball.yvelocity == 0)
	{
		ball.yvelocity = 2;
	}
	
	//runs a game of Pong
	while (gameover(score))
	{
		gfx_clear();
		draw_ball(ball);
		draw_paddles(paddlel,paddler);
		draw_court();
		
		//check to see if ball collides with paddle
		ball.xvelocity *= paddle_contact(paddlel,paddler,ball);
		
		//check to see if ball collides with vertical walls
		ball.yvelocity *= vertical_contact(ball);
		
		//check to see if ball gets past paddles
		scont = score_contact(ball);
		if (scont == 1)
		{
			score.rscore ++;
			ball.ypos = 200;
			ball.xpos = 400;
			q = rand() % 4;
			switch (q)
			{
				case 0:
					ball.xvelocity = rand() % 10;
					ball.yvelocity = rand() % 10;
					break;
				case 1:
					ball.xvelocity = (-1)*(rand() % 10);
					ball.yvelocity = rand() % 10;
					break;
				case 2:
					ball.xvelocity = rand() % 10;
					ball.yvelocity = (-1)*(rand() % 10);
					break;
				default :
					ball.xvelocity = (-1)*(rand() % 10);
					ball.yvelocity = (-1)*(rand() % 10);
			}
		}
		if (scont == 2)
		{
			score.lscore ++;
			ball.ypos = 200;
			ball.xpos = 400;
			q = rand() % 4;
			switch (q)
			{
				case 0:
					ball.xvelocity = rand() % 10;
					ball.yvelocity = rand() % 10;
					break;
				case 1:
					ball.xvelocity = (-1)*(rand() % 10);
					ball.yvelocity = rand() % 10;
					break;
				case 2:
					ball.xvelocity = rand() % 10;
					ball.yvelocity = (-1)*(rand() % 10);
					break;
				default :
					ball.xvelocity = (-1)*(rand() % 10);
					ball.yvelocity = (-1)*(rand() % 10);
			}
		}
		if (ball.xvelocity == 0)
		{
			ball.xvelocity = 2;
		}
		if (ball.yvelocity == 0)
		{
			ball.yvelocity = 2;
		}
		
		//moves the paddles
		paddlel.ypos += move_paddlel(paddlel);
		paddler.yvelocity *= move_paddler(paddler);
		paddler.ypos += paddler.yvelocity;
		
		//move the ball
		ball.xpos += ball.xvelocity;
		ball.ypos += ball.yvelocity;
		
		//print the score
		print_score(score);
		
		//animate framerate
		gfx_flush();
		usleep(22500);
	}
}

void draw_paddles(struct Paddle paddlel, struct Paddle paddler)
{
	//draws the human and ai paddles
	gfx_color(0,255,0);
	gfx_fill_rectangle(paddlel.xpos-4,paddlel.ypos-40,8,80);
	gfx_color(255,0,0);
	gfx_fill_rectangle(paddler.xpos-4,paddler.ypos-40,8,80);
	gfx_flush();
}

void draw_ball(struct Ball ball)
{
	//draws the ball
	gfx_color(51,255,255);
	gfx_fill_circle(ball.xpos,ball.ypos,20);
	gfx_flush();
}

void draw_court()
{
	//draws the bounds of the play area
	gfx_color(255,255,255);
	gfx_fill_rectangle(0,0,800,4);
	gfx_fill_rectangle(0,400,800,4);
	int i;
	for(i=4;i<396;i+=10)
	{
		gfx_line(400,i,400,i+5);
	}
	gfx_text(225,500,"Use 'W' and 'S' to Move Your Paddle");
	gfx_flush();
}

int paddle_contact(struct Paddle paddlel, struct Paddle paddler, struct Ball ball)
{
	if((ball.xpos-25<paddlel.xpos) && (ball.ypos>paddlel.ypos-40) && (ball.ypos<paddlel.ypos+40))
	{
		//hits a paddle and rebounds
		return -1;
	}
	if((ball.xpos+25>paddler.xpos) && (ball.ypos>paddler.ypos-40) && (ball.ypos<paddler.ypos+40))
	{
		//hits a paddle and rebounds
		return -1;
	}
	else
	{
		//no contact
		return 1;
	}
	
}

int vertical_contact(struct Ball ball)
{
	//evaluates if the paddle hits the top or bottom of the court
	if(ball.ypos-25<4 || ball.ypos+25>400)
	{
		return -1;
	}
	else
	{
		return 1;
	}
}

int score_contact(struct Ball ball)
{
	if(ball.xpos-25<0)
	{
		return 1; //left side
	}
	else if(ball.xpos+25>800)
	{
		return 2; //right side
	}
	else
	{
		return 0; //no side contact
	}
}

int move_paddlel(struct Paddle paddlel)
{
	//accepts a move paddle command from the player and assesses its validity
	int m,rt = 0;
	if (gfx_event_waiting())
	{
		m = gfx_wait();
		switch (m)
		{
			case 'w':
				if (paddlel.ypos >= 49)
				{
					rt = -8;
				}
				break;
			case 's':
				if (paddlel.ypos <= 355)
				{
					rt = 8;
				}
				break;
			default :
				break;
		}
	}
	//returns a move up or down if such an ordered move is valid
	return rt;
}

int move_paddler(struct Paddle paddler)
{
	//ai code for the right paddle
	int rt = 1;
	if (paddler.ypos <= 49 || paddler.ypos >= 355) rt = -1;
	return rt;
}

void print_score(struct Score score)
{
	//prints the current score
	gfx_text(370,450,"SCORE:");
	gfx_text(370,475,"L:");
	gfx_text(390,475,num2str(score.lscore));
	gfx_text(410,475,"R:");
	gfx_text(430,475,num2str(score.rscore));
	gfx_flush();
}

int gameover(struct Score score)
{
	//evaluates if the score limit has been reached
	int rt = 1;
	if (score.lscore > 9 || score.rscore > 9)
	{
		rt = 0;
	}
	return rt;
}

void draw_main_screen()
{
	//draws the program's main menu
	gfx_clear_color(0,0,0);
	gfx_clear();
	
	gfx_color(204,0,0);
	gfx_fill_rectangle(50,200,200,200); //pong
	gfx_color(255,255,255);
	gfx_text(120,300,"PONG!");
	
	
	gfx_color(0,153,0);
	gfx_fill_rectangle(300,200,200,200); //minesweeper
	gfx_color(255,255,255);
	gfx_text(370,300,"MINESWEEPER!");
	
	gfx_color(0,0,255);
	gfx_fill_rectangle(550,200,200,200); //dino jump
	gfx_color(255,255,255);
	gfx_text(620,300,"DINO JUMP!");
	
	gfx_color(204,0,0);
	gfx_fill_rectangle(300,600,200,100); //quit button
	gfx_color(255,255,255);
	gfx_text(390,650,"QUIT");
	
	gfx_text(300,500,"CLICK THE GAME YOU WANT TO PLAY");
	gfx_flush();
	
}