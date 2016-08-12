//Package.h
//J. Patrick Lacher

#ifndef PACKAGE_H
#define PACKAGE_H

#include <iostream>
#include <string>

using namespace std;

class Package{
	
	public:
	
	//class constructor
	Package(string nName = "John Smith", int nZipCode = 46556, double nWeight = 10.00, double nCost = 0.15);
	
	// returns the cost of shipping a package
	double CalculateCost();
	
	//get functions for private variables
	double getWeight();
	double getCost();
	
	private:
	
	string name; // name of recipient
	int zipCode; // recipient's zip code
	double weight; // weight in ounces
	double cost; // cost to ship per ounce
	
};
#endif