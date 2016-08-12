#include <stdio.h>

int main ( void )
{
   int touchdowns;
   int extrapts;
   int fieldgoals;
   int safeties;
   
   printf( "Enter number of touchdowns: \n");
   scanf( "%d", &touchdowns);
   
   printf( "Enter number of extra points: \n");
   scanf( "%d", &extrapts);
   
   printf( "Enter number of field goals: \n");
   scanf( "%d", &fieldgoals);
   
   printf( "Enter number of safeties: \n");
   scanf( "%d", &safeties);
   
   int score;
   score = (touchdowns*6) + extrapts + (fieldgoals*3) + (safeties*2);
   
   printf( "The Irish scored %d points\n", score);
}
