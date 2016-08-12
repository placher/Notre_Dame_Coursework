//puzzle.h
//J. Patrick Lacher

//Allows for the creation of sudoku boards with a variable data type

#ifndef SUDOKU_H
#define SUDOKU_H

#include <vector>
#include <string>
#include <iostream>
#include <fstream>

using namespace std;

template <typename T>
class puzzle {
	
	public:
		//class constructor
		puzzle(string file);
		
		//prints the board to the terminal
		void print();
		
		//gameplay functions
		int isVictory();
		int placeNumber(int row, int col, int move);
		
	private:
		vector < vector<T> > board;
};

//class constructor
template <typename T>
puzzle<T>::puzzle(string file) {
	string line;
	int i, j;
	vector <T> buffer;
	ifstream myfile (file.c_str());
	if (myfile.is_open()){
		while ( getline(myfile,line) ){
			for (i=0;i<line.length();i++){
				j = line[i];
				if (j != ' '){
					buffer.push_back((T)j);
				}
			}
			board.push_back(buffer);
			buffer.erase(buffer.begin(),buffer.end());
		}
	}
	else {
		cout << "Error: Unable to Open File.\n";
	}
	myfile.close();
}

//prints the board to the terminal
template <typename T>
void puzzle<T>::print() {
	cout << "   0 1 2 3 4 5 6 7 8 \n\n";
	for (int i=0; i<9; i++){
		cout << i << "  ";
		for (int j=0; j<9; j++){
			cout << (char)board[i][j] << " ";
		}
		cout << "\n";
	}
	cout << "\n";
}


//determines if the game has been completed
template <typename T>
int puzzle<T>::isVictory() {
	for (int i=0; i<9; i++){
		for (int j=0; j<9; j++){
			if (board[i][j] == '0') return 0;
		}
	}
	return 1;
}

//evaluates if a move is legal and places the number if sopen
template <typename T>
int puzzle<T>::placeNumber(int row, int col, int move) {
	//converts int moves to char to allow storage in the vector
	if (move >= 0 && move <= 9) move+= '0';
	
	//validates row and column arguments
	if (row < 0 | row > 8 | col < 0 | col > 8) return 0;
	
	//automatically allows setting a tile to 0
	if (move == '0'){
		board[row][col] = move;
		return 1;
	}
	
	int i,j;
	
	//checks row for valid move
	for (i=0; i<9; i++){
		if (board[row][i] == move) return 0;
	}
	
	//checks column for valid move
	for (i=0; i<9; i++){
		if (board[i][col] == move) return 0;
	}
	
	//checks "mini-grid" for valid move
	if (row < 3){
		if (col < 3){
			for (int i=0; i<3; i++){
				for (int j=0; j<3; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
		if (col > 2 && col < 6){
			for (int i=0; i<3; i++){
				for (int j=3; j<6; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
		if (col > 5){
			for (int i=0; i<3; i++){
				for (int j=6; j<9; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
	}
	if (row > 2 && row < 6){
		if (col < 3){
			for (int i=3; i<6; i++){
				for (int j=0; j<3; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
		if (col > 2 && col < 6){
			for (int i=3; i<6; i++){
				for (int j=3; j<6; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
		if (col > 5){
			for (int i=3; i<6; i++){
				for (int j=6; j<9; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
	}
	if (row > 5){
		if (col < 3){
			for (int i=6; i<9; i++){
				for (int j=0; j<3; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
		if (col > 2 && col < 6){
			for (int i=6; i<9; i++){
				for (int j=3; j<6; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
		if (col > 5){
			for (int i=6; i<9; i++){
				for (int j=6; j<9; j++){
					if (board[i][j] == move) return 0;
				}
			}
		}
	}
	
	//makes move if not broken by a return 0
	board[row][col] = move;
	return 1;
}

#endif