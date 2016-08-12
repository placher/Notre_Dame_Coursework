//main.cpp for BankAccount and derived classes
//J. Patrick Lacher

#include "SavingsAccount.h"
#include "CrewMember.h"

using namespace std;

int main(){
	
	SavingsAccount a1;
	CrewMember a2;
	
	a1.printInfo(12);
	a2.printInfo();
	
	return 0;
}