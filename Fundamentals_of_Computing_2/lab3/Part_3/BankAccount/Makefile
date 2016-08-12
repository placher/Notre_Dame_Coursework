all: banking

banking: main.o SavingsAccount.o BankAccount.o
	g++ main.o SavingsAccount.o BankAccount.o -o banking
	
main.o: main.cpp SavingsAccount.h
	g++ -c main.cpp -o main.o

SavingsAccount.o: SavingsAccount.cpp BankAccount.h
	g++ -c SavingsAccount.cpp -o SavingsAccount.o
	
BankAccount.o: BankAccount.cpp
	g++ -c BankAccount.cpp -o BankAccount.o
	
clean:
	rm banking *.o