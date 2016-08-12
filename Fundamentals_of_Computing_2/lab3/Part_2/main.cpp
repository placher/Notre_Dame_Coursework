//main.cpp for Package and derived classes
//J. Patrick Lacher

#include "OvernightPackage.h"
#include "TwoDayPackage.h"

using namespace std;

int main(){
	OvernightPackage p1;
	TwoDayPackage p2;
	
	cout << "The cost of shipping the default package using overnight shipping is: $" << p1.calculateCost() << "\n";
	cout << "The cost of shipping the defualt package using two-day shipping is: $" << p2.calculateCost() << "\n";
	
	return 0;
}