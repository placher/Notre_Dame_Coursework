//TwoDayPackage.cpp
//J. Patrick Lacher

#include "TwoDayPackage.h"

using namespace std;

//class constructor
TwoDayPackage::TwoDayPackage(double nExpedited){
	//validates and assigns the expedited shipping fee
	if (nExpedited >= 0) expeditedCost = nExpedited;
	else {
		cout << "Expedited Shipping Fee invalid. Set to $5.00\n";
		expeditedCost = 5.00;
	}
}

//returns the cost of shipping a package with the added expedited shipping fee
double TwoDayPackage::calculateCost(){
	return((getWeight() * getCost()) + expeditedCost);
}