//main.cpp for CardDeck

#include "CardDeck.h"

using namespace std;

int main(){
	
	CardDeck deck;
	
	cout << "Deck Size: " << deck.getSize() << "\nIs the deck currently in order?: " << deck.inOrder() << "\n";
	deck.shuffle();
	cout << "Deck Shuffled\nIs the deck currently in order?: " << deck.inOrder() << "\n";
	
	return 0;
	}