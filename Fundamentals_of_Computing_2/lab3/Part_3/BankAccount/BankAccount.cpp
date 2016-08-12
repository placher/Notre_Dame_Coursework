//BankAccount.cpp
//J. Patrick Lacher

#include "BankAccount.h"

using namespace std;

//class constructor
BankAccount::BankAccount(){
	accountNumber = 155030780;
	accountBalance = 100000.00;
	accountOwner = "void";
}

//get functions

int BankAccount::getAccountNumber(){
	return accountNumber;
}

double BankAccount::getAccountBalance(){
	return accountBalance;
}

string BankAccount::getAccountOwner(){
	return accountOwner;
}

//set functions

void BankAccount::setAccountNumber(int num){
	accountNumber = num;
}

void BankAccount::setAccountBalance(double bal){
	accountBalance = bal;
}

void BankAccount::setAccountOwner(string own){
	accountOwner = own;
}