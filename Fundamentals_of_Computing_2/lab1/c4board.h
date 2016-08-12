//c4board.h
//J. Patrick Lacher

#include <iostream>
#include <string>
#include "c4col.h"

//Class C4Board
//This class is used to store many C4Col objects to form a connect four board

class C4Board {
	
	public:
		//displays the board to the terminal
		void display();
		//allows two players to play a game
		void play();
		//checks if victory conditions have been met
		int gameover(char,int);
		//constructor to initialize the class
		C4Board();
		//deconstructor to free dynamically allocated memory
		~C4Board();
	private:
		//stores the number of active columns
		int Columns;
		//stores all of the C4Col objects
		C4Col * Board;
};