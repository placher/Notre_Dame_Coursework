//CardDeck.cpp
//J. Patrick Lacher

#include "CardDeck.h"

using namespace std;

//ostream & operator<<(ostream &output, deque<int> &C){
	
//}

//class constructor
CardDeck::CardDeck(int nCards){
	int i;
	for (i=0;i<nCards;i++) cards.push_back(i); //0 1 2 3 ... nCards-1
}

//returns the size of the deck
int CardDeck::getSize(){
	return cards.size();
}

//shuffles the deck
void CardDeck::shuffle(){
	srand(time(NULL));
	random_shuffle(cards.begin(),cards.end());
}

//checks if the members of the deck are in non-decreasing order
bool CardDeck::inOrder(){
	int i;
	for (i=0;i <= cards.size() - 2;i++){
		if (cards[i] > cards[i+1]) return 0;
	}
	return 1;
}