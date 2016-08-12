//CrewMember.cpp
//J. Patrick Lacher

#include "CrewMember.h"

using namespace std;

CrewMember::CrewMember(string nCrewman, int nQuality){
	
	crewman = nCrewman;
	quality = nQuality;
}

void CrewMember::printInfo(){
	cout << "Crewman " << crewman << " has a contribution value of " << quality << "\n";
}