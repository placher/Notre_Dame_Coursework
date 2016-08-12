//c4board.cpp
//J. Patrick Lacher

#include <iostream>
#include <cctype>
#include "c4board.h"

using namespace std;

//class constructor
C4Board::C4Board() {
	//sets the default board size
	Columns = 7;
	//allocate the board array
	Board = new C4Col [7];
}

//class deconstructor
C4Board::~C4Board(){
	//frees dynamically allocated memory
	delete [] Board;
}

//member functions of C4Board

//displays the board to the terminal
void C4Board::display() {
	cout << "\n";
	for (int i = Board[0].getMaxDiscs(); i>= 0; i--){
		for (int j = 0; j < Columns; j++){
			cout << Board[j].getDisc(i) << " ";
		}
		cout << "\n";
	}
}

//allows two players to play a game
void C4Board::play() {
	int move,cont = 1;
	while (cont){
		C4Board::display();
		cout << "\nPlayer 1 please enter the column of your move\n" << "Column: ";
		cin >> move;
		cout << "\n";
		
		//ensures the user entered a valid input
		while (move >= Columns+1 || Board[move].isFull()){
			cout << move << " is not a valid entry. Please enter either a column number or -1 to exit\n";
			cout << "Player 1 please enter the column of your move\n" << "Column: ";
			cin >> move;
			cout << "\n";
		}
		
		//exits if the user selected end game
		if (move == -1){
			cont = 0;
			break;
		}
		
		//adds the disc to the board
		Board[move-1].addDisc('X');
		cont = gameover('X',move-1);
		if (!cont){
			cout << "Congratulations Player 1, You Win!\n";
			break;
		}
		
		//AI Move
		for (int i = 0; i < 7; i++){
			if (Board[i].isFull() == 0){
				move = i;
				break;
			}
		}
		Board[move].addDisc('O');
		cont = gameover('O',move);
		if (!cont){
			cout << "Sorry Player 1, AI Wins.";
		}
	}
}

//checks if victory conditions have been met
int C4Board::gameover(char c, int col) {
	int row,i,j,ret=1;
	
	//determines the row where the most recent disc was placed
	for (i=Board[col].getMaxDiscs();i>=0;i--){
		if (Board[col].getDisc(i) == c){
			row = i;
			break;
		}
	}
	
	//end of a row victories
	
	//checks for a vertical victory
	if (row > 2){
		if (Board[col].getDisc(row-1) == c && Board[col].getDisc(row-2) == c && Board[col].getDisc(row-3) == c){
			ret = 0;
		}
	}
	if (col < 4){
		//checks for a horizontal victory to the right
		if (Board[col+1].getDisc(row) == c && Board[col+2].getDisc(row) == c && Board[col+3].getDisc(row) == c){
			ret = 0;
		}
		//checks for a diagonal down victory to the right
		if (row > 2 && Board[col+1].getDisc(row-1) == c && Board[col+2].getDisc(row-2) == c && Board[col+3].getDisc(row-3) == c){
			ret = 0;
		}
		//checks for a diagonal up victory to the right
		if (row < 3 && Board[col+1].getDisc(row+1) == c && Board[col+2].getDisc(row+2) == c && Board[col+3].getDisc(row+3) == c){
			ret = 0;
		}
	}
	if (col > 2){
		//checks for a horizontal victory to the left
		if (Board[col-1].getDisc(row) == c && Board[col-2].getDisc(row) == c && Board[col-3].getDisc(row) == c){
			ret = 0;
		}
		//checks for a diagonal down victory to the left
		if (row > 2 && Board[col-1].getDisc(row-1) == c && Board[col-2].getDisc(row-2) == c && Board[col-3].getDisc(row-3) == c){
			ret = 0;
		}
		//checks for a diagonal up victory to the left
		if (row < 3 && Board[col-1].getDisc(row+1) == c && Board[col-2].getDisc(row+2) == c && Board[col-3].getDisc(row+3) == c){
			ret = 0;
		}
	}
	
	//middle of a row victories
	
	if (col > 0 && col < 6){
		//checks horizontal victory of type -x--
		if (col < 5 && Board[col-1].getDisc(row) == c && Board[col+1].getDisc(row) == c && Board[col+2].getDisc(row) == c){
			ret = 0;
		}
		//checks horizontal victory of type --x-
		if (col > 1 && Board[col-2].getDisc(row) == c && Board[col-1].getDisc(row) == c && Board[col+1].getDisc(row) == c){
			ret = 0;
		}
		//checks diagonal down right victory of type -x--
		if (row < 5 && row > 1 && col < 5 && Board[col-1].getDisc(row+1) == c && Board[col+1].getDisc(row-1) == c && Board[col+2].getDisc(row-2) == c){
			ret = 0;
		}
		//checks diagonal down right victory of type --x-
		if (row < 4 && row > 0 && col < 4 && Board[col-1].getDisc(row+1) == c && Board[col+1].getDisc(row-1) == c && Board[col+2].getDisc(row-2) == c){
			ret = 0;
		}
		//checks diagonal down left victory of type -x--
		if (row < 5 && row > 1 && col > 1 && Board[col+1].getDisc(row+1) == c && Board[col-1].getDisc(row-1) == c && Board[col-2].getDisc(row-2) == c){
			ret = 0;
		}
		//checks diagonal down left victory of type --x-
		if (row < 4 && row > 0 && col > 0 && Board[col+1].getDisc(row+1) == c && Board[col-1].getDisc(row-1) == c && Board[col-2].getDisc(row-2) == c){
			ret = 0;
		}
		//checks diagonal up right victory of type -x--
		if (row < 4 && row > 0 && col > 0 && Board[col-1].getDisc(row-1) == c && Board[col+1].getDisc(row+1) == c && Board[col+2].getDisc(row+2) == c){
			ret = 0;
		}
		//checks diagonal up right victory of type --x-
		if (row < 5 && row > 1 && col > 1 && Board[col-1].getDisc(row-1) == c && Board[col+1].getDisc(row+1) == c && Board[col+2].getDisc(row+2) == c){
			ret = 0;
		}
		//checks diagonal up left victory of type -x--
		if (row < 6 && row > 1 && col > 0 && Board[col+1].getDisc(row-1) == c && Board[col-1].getDisc(row+1) == c && Board[col-2].getDisc(row+2) == c){
			ret = 0;
		}
		//checks diagonal up left victory of type --x-
		if (row < 5 && row > 0 && col > 1 && Board[col+1].getDisc(row-1) == c && Board[col-1].getDisc(row+1) == c && Board[col-2].getDisc(row+2) == c){
			ret = 0;
		}
	}
	
	//returns the results
	return ret;
}