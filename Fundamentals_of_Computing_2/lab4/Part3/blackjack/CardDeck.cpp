//CardDeck.cpp
//J. Patrick Lacher

#include "CardDeck.h"

using namespace std;

//overloaded output operator
ostream & operator<<(ostream &output, CardDeck &C){
	deque<int>::const_iterator i;
	for (i = C.cards.begin(); i != C.cards.end(); ++i){
		output << *i << ", ";
	}
	output << "\n";
	return output;
}

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

void CardDeck::printReverse(){
	deque<int>::const_iterator i;
	for (i = cards.end(); i != cards.begin(); --i){
		cout << *i << ", ";
	}
	cout << "\n";
}

int CardDeck::Deal(int nPos){
	int i = (1 + cards[nPos]%12);
	if (i >= 10) i = 10;
	if (i == 1) i = 11;
	return i;
}