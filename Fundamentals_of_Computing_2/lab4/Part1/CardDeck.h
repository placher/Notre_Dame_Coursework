//CardDeck.h
//J. Patrick Lacher

#ifndef CARDDECK_H
#define CARDDECK_H

#include <iostream>
#include <deque>
#include <cstdlib>
#include <ctime>
#include <algorithm>

using namespace std;

class CardDeck {
	
	//friend ostream & operator<<(ostream &, deque<int> &);

	public:
	
	//class constructor
	CardDeck(int nCards = 52);
	
	//returns the size of the deck
	int getSize();
	
	//shuffles the deck
	void shuffle();
	
	//checks if the members of the deck are in non-decreasing order
	bool inOrder();
	
	private:
	
	//the deck
	deque<int> cards;
	
};

#endif