#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "gfx5.h"

void minesweeper();
void clearboard();
void placemines(int);
void placemarkers(int,int);
void correctcount();
void buildboard();
void drawsmile();
int playgame();
void setnumbercolor(int,int);

int board[16][30] = {0};

void minesweeper()
{
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
				printf("%d %d \n",col,row);
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

void clearboard( )
{
	int i,j;
	for(i=0;i<16;i++)
		for(j=0;j<30;j++)
		{
			board[i][j]=0;
		}
	
}

