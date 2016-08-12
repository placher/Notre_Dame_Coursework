//main.cpp for CardDeck

#include "CardDeck.h"

using namespace std;

int main(){
	
	//initializes the decks
	CardDeck deck7(7);
	CardDeck deck8(8);
	CardDeck deck9(9);
	
	
	//sort the deck of 7
	int i = 0;
	do {
		deck7.shuffle();
		i++;
	} while (deck7.inOrder() != 1);
	cout << "It took " << i << " shuffles to properly sort a deck of 7 cards\n";
	
	//sort the deck of 8
	i = 0;
	do {
		deck8.shuffle();
		i++;
	} while (deck8.inOrder() != 1);
	cout << "It took " << i << " shuffles to properly sort a deck of 8 cards\n";
	
	//sort the deck of 9
	i = 0;
	do {
		deck9.shuffle();
		i++;
	} while (deck9.inOrder() != 1);
	cout << "It took " << i << " shuffles to properly sort a deck of 9 cards\n";
	
	return 0;
}