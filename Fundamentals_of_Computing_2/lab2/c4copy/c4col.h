//c4col.h
//J. Patrick Lacher

#include <iostream>

//Class C4Col
//This class is used to represent a single column on the connect four board

class C4Col {

	public:
		//tests if the column has been filled with disks
		int isFull();
		//returns a specific disc in the column
		char getDisc(int);
		//determines the number of "rows" in the column
		int getMaxDiscs();
		//adds a disc in the next open space
		void addDisc(char);
		//overloaded add disc operator
		C4Col operator+=(char);
		//constructor to initialize the class
		C4Col();
	
	private:
		//stores the number of disks currently in the column
		int numDiscs;
		//stores the maximum number of disks allowed (rows)
		int Rows;
		//stores the players' disks
		char Discs[6];
};