//mortgage.h
//J. Patrick Lacher

#include <iostream>

//Class Mortgage
//This class is used to store general data about an individual mortgage

class Mortgage {
	
	public:
		//Deducts value from principal remaining
		void credit(double Ammount);
		//Returns the current principal remaining
		double getPrincipal();
		//Calculates and displays an amortization table
		void amortize();
		//Constructor Function
		Mortgage(double nPrincipal = 100000.00,double nRate = 2.5,double nPayment = 1000.00);
	
	private:
		//Stores the remaining principal owed
		double Principal;
		//Stores the monthly interest rate
		double Rate;
		//Stores the desired monthly payment
		double Payment;
};