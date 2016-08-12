//main.cpp for CardDeck

#include "CardDeck.h"

using namespace std;

int main(){
	
	//initializes the deck
	CardDeck deck(10);
	
	//checks if cards are in order
	if (deck.inOrder()) cout << "Cards are in order\n";
	
	//prints the deck in reverse order
	deck.printReverse();
	
	//prints the deck in order
	cout << deck;
	
	//shuffles the deck
	deck.shuffle();
	
	//prints the new order of the deck
	cout << deck;
	
	return 0;
	}