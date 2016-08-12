//BankAccount.h
//J. Patrick Lacher

#ifndef BANKACCOUNT_H
#define BANKACCOUNT_H

#include <iostream>
#include <string>

using namespace std;

class BankAccount{
	
	public:
	
		//class constructor
		BankAccount();
		
		//get functions for class variables
		int getAccountNumber();
		double getAccountBalance();
		string getAccountOwner();
		
		//set functions for class variables
		void setAccountNumber(int);
		void setAccountBalance(double);
		void setAccountOwner(string);
	
	private:
	
		int accountNumber;
		double accountBalance;
		string accountOwner;
	
};
#endif