#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "gfx5.h"

struct Paddle {
	int xpos;
	int ypos;
	int yvelocity;
} paddles;

struct Ball{
	int ypos;
	int xpos;
	int xvelocity;
	int yvelocity;
} balls;

struct Score{
	int lscore;
	int rscore;
} scores;

char *num2str(int);
void pong();
void draw_paddles(struct Paddle,struct Paddle);
void draw_ball(struct Ball);
void draw_court();
int move_paddlel(struct Paddle);
int move_paddler(struct Paddle);
int paddle_contact(struct Paddle,struct Paddle,struct Ball);
void print_score(struct Score);
int score_contact(struct Ball);
int vertical_contact(struct Ball);
int gameover(struct Score);

int scont;

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
	int q;
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

char *num2str(int n)
{
	static char a[10], *p = a;
	snprintf(p,10,"%d",n);
	return p;
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
	int rt = 1;
	if (score.lscore > 9 || score.rscore > 9)
	{
		rt = 0;
	}
	return rt;
}