#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int getwords();
void sortwords(int);
void printboard();
void placewordsdown(int*,int);
void addworddown(int,int,int,int);
int isemptydown(int,int,int,int);
void placewordsacross(int*,int);
int isemptyright(int,int,int,int);
void addwordright(int,int,int,int);
void printpuzzle();
void printunused(int*);

char words[20][16] = {'\0'};
char board[15][16] = {'*'};

void main(void){
	int count,i;
	
	//clears the console screen
	system ("clear");
	
	//gets a list of words from the user and sorts them by length
	count = getwords();
	sortwords(count);

	//tracks which words have been used
	int usedwords[20] = {0};
	for (i=count;i<20;i++){
		usedwords[i] = 1;
	}
	
	//clears the console screen
	system ("clear");

	//places the longest word horizontally in the middle of the board
	strcpy(board[7],words[0]);
	usedwords[0] = 1;
	printf("Clues:\n");
	printf("%2d,%2d Across %s\n",7,0,strfry(words[0]));
	
	//makes a pass placing words vertically
	placewordsdown(usedwords,count);
	//makes a pass placing words horizontally
	placewordsacross(usedwords,count);
	//successive calls alternating vertical and horizontal placement
	placewordsdown(usedwords,count);
	placewordsacross(usedwords,count);
	placewordsdown(usedwords,count);
	placewordsacross(usedwords,count);

	//prints the solution to the board
	printboard();
	
	//prints the blank puzzle
	printpuzzle();
	
	//notifies the user of any unplacable words
	printunused(usedwords);
}

int getwords(){
	//Reads in User-Entered Words
	printf("Please enter up to 20 words, seperated by either spaces or new lines: \n");
	int i,j;
	for (i=0;i<20;i++){
		scanf("%s",words[i]);
		if (words[i][0] == '.'){
			words[i][0] = '\0';
			break;
		}
		for (j=0;j<=15;j++){
			words[i][j] = toupper(words[i][j]);
		}
	}
	return i;
}

void sortwords(int count){
	//Uses a Bubble Sort to Order Words in Descending Order of Length
	char buffer[16]={'\0'};
	int i,j,k;
	for (i=0;i<count;i++){
		for (j=0;j<(count-i);j++){
			if (strlen(words[j+1]) > strlen(words[j])){
				strcpy(buffer,words[j]);
				strcpy(words[j],words[j+1]);
				strcpy(words[j+1],buffer);
			}
			for (k=0;k<16;k++){
				buffer[k] = '\0';
			}
		}
	}
}

void printboard(){
	//prints the current state of the board to the console
	int i,j;
	for (i=0;i<15;i++){
		for (j=0;j<15;j++){
			if (!isalpha(board[i][j])){
				board[i][j] = '.';
			}
		}
	}
	printf("\nSolution: \n");
	for (i=0;i<15;i++){
		printf("%s \n",board[i]);
	}
	printf("\n");
}

void placewordsdown(int *usedwords,int count){
	//Makes a Pass to Place All Unused Words Vertically
	int brow,bcol,word,let,i,j;
	for (word=0;word<=count;word++){
		if (usedwords[word] == 0){
			for (brow=0;brow<15;brow++){
				for (bcol=0;bcol<=15;bcol+=2){
					for (i=0;i<15;i++){
						if (words[word][i] == board[brow][bcol] && isemptydown(brow,bcol,word,i)){
							if (words[word][i] == '\0') break;
							addworddown(brow,bcol,word,i);
							usedwords[word] = 1;
							printf("%2d,%2d Down   %s\n",brow-i,bcol,strfry(words[word]));
							break;
						}
					}
					if (usedwords[word] == 1) break;
				}
				if (usedwords[word] == 1) break;
			}
		}
	}
}

int isemptydown(int brow,int bcol,int word, int i){
	//Tests to See if a Word Will Fit Vertically
	int length,tf=1,j,bmove=1;
	length = strlen(words[word]);
	//word will go off top of board
	if ((brow-i)<0){
		tf = 0;
	}
	//word will go off bottom of board
	if (brow+(length-(i+1)) > 14){
		tf = 0;
	}
	//another word is too close above
	for (j=i;j>=0;j--){
		if (isalpha(board[brow-bmove][bcol]) && board[brow-bmove][bcol] != '*'){
			tf = 0;
			break;
		}
		bmove ++;
	}
	//another word is too close below
	bmove = 1;
	for (j=i+1;j<=length;j++){
		if (isalpha (board[brow+bmove][bcol]) && board[brow+bmove][bcol] != '*'){
			tf = 0;
			break;
		}
		bmove++;
	}
	return tf;
}

void addworddown(int brow,int bcol,int word,int i){
	//Adds A Word to the Board Vertically
	int j,srow=(brow-i);
	for (j=0;j<strlen(words[word]);j++){
		board[srow][bcol] = words[word][j];
		srow++;
	}
}

void placewordsacross(int *usedwords,int count){
	//Makes a Pass to Place All Unused Words Horizontally
	int brow,bcol,word,let,i,j;
	for (word=0;word<=count;word++){
		if (usedwords[word] == 0){
			for (brow=0;brow<15;brow+=2){
				for (bcol=0;bcol<=15;bcol++){
					for (i=0;i<15;i++){
						if (words[word][i] == board[brow][bcol] && isemptyright(brow,bcol,word,i)){
							if (words[word][i] == '\0') break;
							addwordright(brow,bcol,word,i);
							usedwords[word] = 1;
							printf("%2d,%2d Across %s\n",brow,bcol-i,strfry(words[word]));
							break;
						}
					}
					if (usedwords[word] == 1) break;
				}
				if (usedwords[word] == 1) break;
			}
		}
	}
}

int isemptyright(int brow,int bcol,int word, int i){
	//Tests to See if a Word Will Fit Horizontally
	int length,tf=1,j,bmove=1;
	length = strlen(words[word]);
	//word will go off left of board
	if ((bcol-i)<0){
		tf = 0;
	}
	//word will go off right of board
	if (bcol+(length-(i+1)) > 14){
		tf = 0;
	}
	//another word is too close to the left
	for (j=i;j>=0;j--){
		if (isalpha(board[brow][bcol-bmove]) && board[brow][bcol-bmove] != '*'){
			tf = 0;
			break;
		}
		bmove ++;
	}
	//another word is too close to the right
	bmove = 1;
	for (j=i+1;j<=length;j++){
		if (isalpha (board[brow][bcol+bmove]) && board[brow][bcol+bmove] != '*'){
			tf = 0;
			break;
		}
		bmove++;
	}
	return tf;
}

void addwordright(int brow,int bcol,int word,int i){
	//Adds A Word to the Board Horizontally
	int j,scol=(bcol-i);
	for (j=0;j<strlen(words[word]);j++){
		board[brow][scol] = words[word][j];
		scol++;
	}
}

void printpuzzle(){
	//Prints a Blank Puzzle to the Console
	int i,j;
	for (i=0;i<15;i++){
		for (j=0;j<15;j++){
			if (!isalpha(board[i][j])){
				board[i][j] = '#';
			}
			if (isalpha(board[i][j])){
				board[i][j] = ' ';
			}
		}
	}
	printf("\nCrossword Puzzle: \n");
	for (i=0;i<15;i++){
		printf("%s \n",board[i]);
	}
	printf("\n");
}

void printunused(int *usedwords){
	//Prints a List of Any Words the Algorithm was Unable to Place in the Puzzle
	int i,counter=0;
	printf("\nUnplaceable Words:\n");
	for (i=0;i<20;i++){
		if (usedwords[i] == 0){
			printf("%s\n",words[i]);
			counter++;
		}
	}
	if (counter == 0) printf("All words were placed successfully.\n");
	printf("\n");
}