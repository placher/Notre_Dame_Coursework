//CardDeck.h
//J. Patrick Lacher

#ifndef CARDDECK_H
#define CARDDECK_H

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <algorithm>
#include "NDVector.h"

using namespace std;

class CardDeck {
	
	friend ostream & operator<<(ostream &, CardDeck &);
	
	public:
	
	//class constructor
	CardDeck(int nCards = 52);
	
	//shuffles the deck
	void shuffle();
	
	//checks if the members of the deck are in non-decreasing order
	bool inOrder();
	
	
	private:
	
	//the deck
	NDVector<int> cards;
	
};

#endif