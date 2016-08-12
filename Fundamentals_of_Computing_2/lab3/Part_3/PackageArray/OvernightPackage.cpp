//OvernightPackage.cpp
//J. Patrick Lacher

#include "OvernightPackage.h"

using namespace std;

//class constructor
OvernightPackage::OvernightPackage(double nAdditionalCost){
	if (nAdditionalCost >= 0) additionalCost = nAdditionalCost;
	else {
		cout << "Expedited Shipping Fee invalid. Set to $0.20 per ounce\n";
		additionalCost = 0.20;
	}
}

//returns the cost of shipping a package with the added expedited shipping fee
double OvernightPackage::calculateCost(){
	return ((getWeight() * getCost()) + (getWeight() * additionalCost));
}