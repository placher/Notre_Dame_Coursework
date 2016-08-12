//main.cpp for Package and derived classes in part 3
//J. Patrick Lacher

#include "OvernightPackage.h"
#include "TwoDayPackage.h"

using namespace std;

int main(){
	//create arrays of packages
	OvernightPackage overNight[3];
	TwoDayPackage twoDay[3];
	
	//set new names for all recipients
	overNight[1].setName("Patrick Lacher");
	overNight[2].setName("Joe Montana");
	twoDay[0].setName("Tom Brady");
	twoDay[1].setName("Peyton Manning");
	twoDay[2].setName("Cam Newton");
	
	//display shipping information and accumulate cost for Overnight Packages
	int i = 0;
	double totalCost = 0.00;
	cout << "\nOvernight Packages:\n";
	for (i=0;i<3;i++){
		cout << "Name: " << overNight[i].getName() << "\tZip Code: " << overNight[i].getZipCode() << "\n";
		totalCost += overNight[i].calculateCost();
	}
	cout << "\nTwo-Day Shipping Packages:\n";
	for (i=0;i<3;i++){
		cout << "Name: " << twoDay[i].getName() << " \tZip Code: " << twoDay[i].getZipCode() << "\n";
		totalCost += twoDay[i].calculateCost();
	}
	
	//Display total cost for the day
	cout << "\nTotal Cost of Shipping for the Day: $" << totalCost << "\n";
	
	return 0;
}