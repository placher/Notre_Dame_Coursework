//CrewMember.h
//J. Patrick Lacher

#include "BankAccount.h"

using namespace std;

class CrewMember: public BankAccount{
	
	public:
	
		//constructor
		CrewMember(string nCrewman = "Pirate Pete", int nQuality = 1);
	
		//"fun" print class
		void printInfo();
	
	private:
	
		string crewman;
		int quality;
};