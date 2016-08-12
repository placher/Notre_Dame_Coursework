//OvernightPackage.h
//J. Patrick Lacher

#include "Package.h"

class OvernightPackage: public Package {
	
	public:
	
	//class constructor
	OvernightPackage(double nAdditionalCost = 0.55);
	
	//returns the cost of shipping a package with the added expedited shipping fee
	double calculateCost();
	
	private:
	
	double additionalCost;
	
};