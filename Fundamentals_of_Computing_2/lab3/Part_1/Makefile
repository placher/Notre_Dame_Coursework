all: banking

banking: main.o SavingsAccount.o CrewMember.o BankAccount.o
	g++ main.o SavingsAccount.o CrewMember.o BankAccount.o -o banking
	
main.o: main.cpp SavingsAccount.h CrewMember.h
	g++ -c main.cpp -o main.o

SavingsAccount.o: SavingsAccount.cpp BankAccount.h
	g++ -c SavingsAccount.cpp -o SavingsAccount.o
	
CrewMember.o: CrewMember.cpp BankAccount.h
	g++ -c CrewMember.cpp -o CrewMember.o
	
BankAccount.o: BankAccount.cpp
	g++ -c BankAccount.cpp -o BankAccount.o
	
clean:
	rm banking *.o