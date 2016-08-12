//CardDeck.cpp
//J. Patrick Lacher

#include "CardDeck.h"

using namespace std;

//overloaded output operator
ostream & operator<<(ostream &output, CardDeck &C){
	C.cards.print();
}

//class constructor
CardDeck::CardDeck(int nCards){
	int i;
	cards.clear();
	for (i=0;i<nCards;i++) cards.push_back(i); //0 1 2 3 ... nCards-1
}

//shuffles the deck
void CardDeck::shuffle(){
	int i, j, temp1, temp2;
	for ( i = 1; i < cards.getSize(); i++) {
		temp1 = cards[i];
		j = rand() % i;
		temp2 = cards[j];
		cards[i] = temp2;
		cards[j] = temp1;
	}
}

//checks if the members of the deck are in non-decreasing order
bool CardDeck::inOrder(){
	int i;
	for (i=0;i <= cards.getSize() - 2;i++){
		if (cards[i] > cards[i+1]) return 0;
	}
	return 1;
}
