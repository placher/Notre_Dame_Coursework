//main.cpp for CardDeck

#include "CardDeck.h"

using namespace std;

int main(){
	
	//initialize random seed
	srand(time(NULL));
	
	//initializes the deck
	CardDeck deck(52);
	
	//checks if cards are in order
	if (deck.inOrder()) cout << "Cards are in order\n";

	//prints the deck in order
	cout << deck;
	
	//shuffles the deck
	deck.shuffle();
	
	//prints the new order of the deck
	cout << deck;
	
	return 0;
	}