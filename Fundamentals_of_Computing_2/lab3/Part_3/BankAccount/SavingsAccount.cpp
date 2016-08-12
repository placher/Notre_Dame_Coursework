//SavingsAccount.cpp
//J. Patrick Lacher

#include "SavingsAccount.h"

using namespace std;

//class constructor
SavingsAccount::SavingsAccount(double nInterestRate, int nTimeInAccount){
	interestRate = nInterestRate;
	timeInAccount = nTimeInAccount;
};

//set functions
void SavingsAccount::setInterestRate(double robbery){
	interestRate = robbery;
}

void SavingsAccount::setAmmountEmbezzled(double plunder){
	ammountEmbezzled = plunder;
}

//"fun" print function
void SavingsAccount::printInfo(int months){
	ammountEmbezzled += (.005*months*b.getAccountBalance());
	b.setAccountBalance((b.getAccountBalance()*(1.0+interestRate*months))-ammountEmbezzled);
	cout << "Account " << b.getAccountNumber() << " has $" << b.getAccountBalance() << " after " << months << " months.\n";
	cout << "The bank has liberated $" << ammountEmbezzled << " to date from this account. \n";
}