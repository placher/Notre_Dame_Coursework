//TwoDayPackage.h
//J. Patrick Lacher

#include "Package.h"

class TwoDayPackage: public Package {
	
	public:
	
	//class constructor
	TwoDayPackage(double nExpedited = 2.00);
	
	//returns the cost of shipping a package with the added expedited shipping fee
	double calculateCost();
	
	private:
	
	double expeditedCost;
	
};