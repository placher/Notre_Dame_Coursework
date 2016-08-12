//SavingsAccount.h
//J. Patrick Lacher

#include "BankAccount.h"

using namespace std;

class SavingsAccount: public BankAccount{
	
	public:
		
		//class constructor
		SavingsAccount(double nInterestRate = 0.0075, int nTimeInAccount = 0);
		
		//set functions
		void setInterestRate(double);
		void setAmmountEmbezzled(double);
		
		//"fun" print statement
		void printInfo(int);
	
	private:
	
		double interestRate;
		int timeInAccount;
		double ammountEmbezzled;
	
};