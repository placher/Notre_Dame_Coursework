//connectfour.cpp
//J. Patrick Lacher

#include <iostream>
#include <string>
#include "c4col.h"

using namespace std;

//class constructor

C4Col::C4Col(){
	//sets the current number of discs to 0
	numDiscs = 0;
	//sets the maximum number of allowed rows
	Rows = 5;	//using base-zero counting (0,1,2,3,4,5)
	//allocate the Disc array
	Discs = new char [6];
	int i;
	for (i=0;i<6;i++){
		Discs[i] = '-';
	}
}

//class deconstructor

C4Col::~C4Col(){
	//frees dynamically allocated memory
	delete [] Discs;
}

//member functions of C4Col

//tests if the column has been filled with disks
int C4Col::isFull(){
	if (numDiscs == Rows+1){
		return 1;
	}
	else{
		return 0;
	}
}

//returns a specific disc in the column
char C4Col::getDisc(int n){
	return Discs[n];
}

//determines the number of "rows" in the column
int C4Col::getMaxDiscs(){
	return Rows;
}

//adds a disc in the next open space
void C4Col::addDisc(char n){
	Discs[numDiscs] = n;
	numDiscs++;
}