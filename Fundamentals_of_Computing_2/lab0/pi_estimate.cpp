//pi_estimate.cpp
//J. Patrick Lacher

#include <iostream>
using namespace std;

int main(void){
	//initialize variables
	int nTerms=0,sign=1;
	double i,piEstimate=0;
	while (nTerms < 2){
		cout << "Please enter the number of terms int the series: ";
		cin >> nTerms;
		cout <<"\n";
		if (nTerms < 2){
			cout << "Error! Provided value must be >= 2!" << "\n";
		}
	}
	for(i=0;i<nTerms;i++){
		//implements the algorithm for each indicated term
		piEstimate += sign*(4/(1+(2*i)));
		sign *= -1;
		//prints the estimate to the console
		cout << "Estimate after " << (i+1) << " term(s):\t" << piEstimate << "\n";
	}
}