//main.cpp for mortgage
//J. Patrick Lacher

#include <iostream>
#include "mortgage.h"

using namespace std;

int main () {
	//Uses non-default initialization; for 2b
	Mortgage first (10000, 5.0, 750);
	//Uses default constructor, mortgage of $100k; for 2c
	Mortgage second;
	
	//Demonstrate functions requested in 2d
	
	//Credit $10,000.00
	second.credit(10000.00);
	cout << "Current balance after crediting second mortgage 10K: " << second.getPrincipal() << "\n";
	cout << "Amortization schedule for first mortgage:" << "\n";
	first.amortize();
 }