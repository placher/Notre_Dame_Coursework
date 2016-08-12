//main.cpp for CardDeck

#include "CardDeck.h"

using namespace std;

int main(){
	
	//initializes the deck
	CardDeck deck(52);
	deck.shuffle();
	
	int player = 0;
	int dealer = 0;
	int pwins = 0;
	int dwins = 0;
	int playing = 1;
	int dPos = 0;
	int pCont = 1;
	int select;
	
	//play a game
	while (playing) {
		while (1) {
			player = 0;
			dealer = 0;
			pCont = 1;
		
			//deal the player 2 cards
			player += deck.Deal(dPos);
			dPos++;
			player += deck.Deal(dPos);
			dPos++;
		
			//deal the dealer 2 cards
			dealer += deck.Deal(dPos);
			dPos++;
			dealer += deck.Deal(dPos);
			dPos++;
		
			cout << "Dealer has: " << dealer << "\nYou have: " << player << "\n";
		
			//allow the player to hit
			while (player < 21 && pCont == 1) {
				cout << "Press 1 to hit or 0 to stay: ";
				cin >> select;
				//validate input
				while (select != 1 && select != 0){
					cout << "\nPlease enter a valid input: ";
					cin >> select;
				}
				//deal player another card
				if (select){
					player += deck.Deal(dPos);
					dPos++;
					cout << "\nDealer has: " << dealer << "\nYou have: " << player << "\n";
				}
				else break;
			}
			
			//end game if player went over 21
			if (player > 21) {
				cout << "Sorry, you lose\n\n";
				dwins++;
				break;
			}
			
			//hit the dealer to >= 17
			if (dealer < 17) {
				while (dealer < 17) {
					dealer += deck.Deal(dPos);
					dPos++;
				}
			}
			
			//print final results of the hand
			cout << "\nDealer has: " << dealer << "\nYou have: " << player << "\n\n";
			if (player > dealer | dealer > 21){
				cout << "You win \n\n";
				pwins++;
			}
			else{
				cout << "Sorry, you lose\n\n";
				dwins++;
			}
			
			//reset deck if necissary
			if (dPos >= 36){
				deck.shuffle();
				dPos = 0;
			}
			
			break;
			
		}
		
		//ask if the player would like to continue playing
		cout << "You have won " << pwins << " hands and the dealer has won " << dwins << " hands.\n";
		cout << "Press 1 to keep plaing or 0 to quit: ";
		cin >> playing;
		//validate input
		while (playing != 1 && playing != 0){
			cout << "\nPlease enter a valid input: ";
			cin >> playing;
		}
		cout << "\n\n";
	}
	
	return 0;
}