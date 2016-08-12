#include <stdio.h>

int wins[] = 
 { 6, 8, 6, 8, 5, 5, 6, 6, 8, 7, 4,
   6, 7, 7, 6, 7, 8, 6, 3, 9, 9, 10,
   8, 9, 10, 7, 9, 7, 5, 9, 10, 6, 6,
   3, 6, 7, 6, 6, 8, 7, 7, 8, 7, 9,
   8, 7, 8, 9, 9, 10, 4, 7, 7, 9, 9,
   8, 2, 7, 6, 5, 2, 5, 5, 2, 9, 7,
   9, 8, 7, 8, 10, 8, 8, 11, 10, 8, 9,
   11, 9, 7, 9, 5, 6, 7, 7, 5, 5, 8,
   12, 12, 9, 10, 10, 11, 6, 9, 8, 7, 9,
   5, 9, 5, 10, 5, 6, 9, 10, 3, 7, 6,
   8, 8, 12, 9, 8 };

int losses[] = 
 { 3, 1, 2, 0, 3, 4, 1, 0, 1, 0, 1,
   0, 0, 0, 2, 1, 1, 1, 1, 0, 0, 1,
   1, 1, 0, 2, 1, 1, 4, 0, 0, 2, 2,
   5, 3, 1, 2, 2, 1, 2, 2, 0, 2, 1,
   2, 2, 0, 0, 0, 0, 4, 2, 2, 0, 1,
   2, 8, 3, 4, 5, 8, 5, 5, 7, 1, 2,
   0, 2, 2, 2, 1, 2, 3, 0, 2, 3, 3,
   1, 3, 4, 2, 6, 4, 5, 5, 6, 6, 4,
   0, 1, 3, 3, 1, 1, 5, 3, 3, 6, 3,
   7, 3, 6, 3, 7, 6, 3, 3, 9, 6, 6,
   5, 5, 1, 4, 5 };
   
	int main(void){
		int n=(sizeof(wins)/sizeof(wins[0])),choice,i=0,j=0;
		printf("1: Display the results for a given year.\n");
		printf("2: Display the most recent year the team won a certain number of games.\n");
		printf("3: Display a list of the years the team had a winning record.\n");
		printf("4: Display a list of the years the team played a certain number of games.\n");
		printf("5: Display a list of the years the team was undefeated.\n");
		printf("6: Display the number of years the team has the same number of wins as losses.\n");
		printf("7: Exit\n");
		printf("Enter your choice: ");
		scanf("%d",&choice);
		switch (choice){
		//display the results of a given year
			case 1:
		       printf("Enter a year (1900-present): ");
		       int year;
		       scanf("%d",&year);
		       printf("The record was %d wins and %d losses\n",wins[year-1900],losses[year-1900]);
		       break;
		//display the most recent year the team won a certain number of games
			case 2:
				printf("Enter the number of wins (must be 12 or less): ");
				int games;
				scanf("%d",&games);
				for (i=n;i>=0;i-=1){
					if (wins[i] == games){
						printf("The most recent year with %d wins was %d\n",games,(i+1900));
						break;
					}
				}
				break;
		//display a list of the years the team had a winning record
			case 3:
				printf("Notre Dame had a winning record in the following years:\n");
				for (i=0;i<=n;i++){
					if (wins[i] > losses[i]){
						printf("%d\t",(i+1900));
						j++;
						if (j == 10){
							printf("\n");
							j=0;
						}
					}
				}
				printf("\n");
				break;
		//display a list of the years the team played a certain number of games
			case 4:
				printf("NOTE: Does not include ties as games played.\n");
				printf("How many games?: ");
				int appearances,totgames;
				scanf("%d",appearances);
				for (i=0;i<n;i++){
					totgames = (wins[i] + losses[i]);
					if (totgames == appearances){
						printf("%d\t",(1900+i));
						j++;
						if (j == 10){
							printf("\n");
							j=0;
						}
					}
				}
				printf("\n");
				break;
		//display a list of the years the team was undefeated
			case 5:
				printf("Notre Dame was undefeated in the following years:\n");
				for (i=0;i<n;i++){
					if (losses[i] = 0){
						printf("%d\t",(1900+i));
						j++;
						if (j == 10){
							printf("\n");
							j=0;
						}  
					}
				}
				printf("\n");
				break;
		//display the number of years the team has the same number of wins as losses
			case 6:
				printf("The following is a list of years Notre Dame had as many wins as losses:\n");
				for (i=0;i<n;i++){
					if (wins[i] == losses[i]){
						printf("%d\t",(1900+i));
						j++;
						if (j == 10){
							printf("\n");
							j=0;
						}
					}
				}
				printf("\n");
				break;
		//exit the program
			case 7:
				printf("Good Bye!");
				break;
		}
	}