//main.cpp for puzzle
//J. Patrick Lacher

#include "puzzle.h"

int main(){
	//initialize puzzle and movement variables
	puzzle<int> game("sample_puzzle.txt");
	int row, col, move;
	
	//play game
	while (game.isVictory() == 0){
		//print the current state of the board
		game.print();
		
		//get user's next move
		cout << "Please enter information for your next move:\nRow: ";
		cin >> row;
		cout << "Column: ";
		cin >> col;
		cout << "Move: ";
		cin >> move;
		
		//make move/report error
		if (game.placeNumber(row,col,move) == 0){
			cout << "\n\nError: Move Invalid";
		}
		
		cout << "\n\n";
	}
	
	//show completed board and congratulate user
	game.print();
	cout << "Congratulations! You completed the puzzle!\n";
	
	return 0;
}