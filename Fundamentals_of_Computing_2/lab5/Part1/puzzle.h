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
	for (int i=0; i<9; i++){
		for (int j=0; j<9; j++){
			cout << (char)board[i][j] << " ";
		}
		cout << "\n";
	}
}

#endif