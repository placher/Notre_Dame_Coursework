all: blackjack

blackjack: main.o CardDeck.o
	g++ main.o CardDeck.o -o blackjack
	
main.o: main.cpp CardDeck.h
	g++ -c main.cpp -o main.o
	
CardDeck.o: CardDeck.cpp
	g++ -c CardDeck.cpp -o CardDeck.o
	
clean:
	rm blackjack *.o