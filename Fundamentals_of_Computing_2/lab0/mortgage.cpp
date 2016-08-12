//mortgage.cpp
//J. Patrick Lacher

#include <iostream>
#include <iomanip>
#include "mortgage.h"

using namespace std;

//Implementation file for mortgage.h

//Class Constructor
Mortgage::Mortgage(double nPrincipal, double nRate, double nPayment){
	Principal = nPrincipal;
	//stores interest rate as a decimal instead of a percentage
	Rate = nRate*.01;
	Payment = nPayment;
	//detects a payment smaller than the interest
	if (nPayment <= (.01*nRate*nPrincipal)){
		cout << "Error: Payment too small, class parameters set to zero. \n";
		Principal = 0;
		Rate = 0;
		Payment = 0;
	}
	//detects a negative interest rate
	if (nRate < 0){
		cout << "Error: Interest rate negative, class parameters set to zero. \n";
		Principal = 0;
		Rate = 0;
		Payment = 0;
	}
}

//Member Functions for Mortgage

//Deducts value from principal remaining
void Mortgage::credit(double Ammount){
	Principal -= Ammount;
	if (Principal <= 0){
		Principal = 0;
	}
}

//Returns the current principal remaining
double Mortgage::getPrincipal(){
	return Principal;
}

//Calculates and displays an amortization table
void Mortgage::amortize(){
	double Interest;
	int Month = 0;
	cout << "Month" << "\t" << "Payment  " << "\t" << "Interest" << "\t" << "Balance" << "\n";
	cout << std::fixed;
	while (Principal >= 0.1){
		Interest = Rate*Principal;
		Principal += Interest;
		if (Principal < Payment){
			Payment = Principal;
		}
		Principal -= Payment;
		Month ++;
		cout << std::setprecision(2) << Month << "\t" << Payment << "  \t" << Interest << "   \t" << 
		Principal << "\n";
	}
}
