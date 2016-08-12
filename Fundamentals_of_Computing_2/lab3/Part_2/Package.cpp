//Package.cpp
//J. Patrick Lacher

#include "Package.h"

using namespace std;

//class constructor
Package::Package(string nName, int nZipCode, double nWeight, double nCost){
	//set name to entered name
	name = nName;
	
	//validate zip code and set its value
	if (nZipCode >= 10000 && nZipCode <= 99999) zipCode = nZipCode;
	else {
		cout << "Zip Code invalid. Set to 46556\n";
		zipCode = 46556;
	}
	
	//validate weight and set its value
	if (nWeight >= 0) weight = nWeight;
	else {
		cout << "Weight invalid. Set to 0.00 oz\n";
		weight = 0.00;
	}
	
	//validate cost and set its value
	if (nCost >= 0) cost = nCost;
	else {
		cout << "Cost invalid. Set to $0.00 per ounce\n";
		cost = 0.00;
	}
}

//returns the cost of shipping a package
double Package::CalculateCost(){
	return (weight * cost);
}

//get functions for private variables
double Package::getWeight(){
	return weight;
}

double Package::getCost(){
	return cost;
}