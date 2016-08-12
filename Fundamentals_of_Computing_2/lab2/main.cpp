//main.cpp for Rational
//J. Patrick Lacher

#include "Rational.h"
#include <iostream>

using namespace std;

int main(){
	//initialize variables
	Rational r1;
	Rational r2;
	int n1,d1,n2,d2;
	
	//gather information about the fractions
	cout << "Please enter information about the first fraction-\nNumerator: ";
	cin >> n1;
	cout << "Denominator: ";
	cin >> d1;
	cout << "Please enter information about the second fraction-\nNumerator: ";
	cin >> n2;
	cout << "Denominator: ";
	cin >> d2;
	cout << "\n";
	
	//populate classes
	d1 = r1.storeFraction(n1,d1);
	d2 = r2.storeFraction(n2,d2);
	
	//display original fractions
	cout << "Fraction 1: " << r1 << "\nFraction 2: " << r2 << "\n";
	
	//display basic math functions, resetting fractions after each operation
	r1 += r2;
	cout << "Fraction 1 + Fraction 2: " << r1 << "\n";
	d1 = r1.storeFraction(n1,d1);
	r1 -= r2;
	cout << "Fraction 1 - Fraction 2: " << r1 << "\n";
	d1 = r1.storeFraction(n1,d1);
	r1 *= r2;
	r1 /= r2;
	cout << "(Fraction 1 * Fraction 2)/Fraction 2: " << r1 << "\n";
	d1 = r1.storeFraction(n1,d1);
	
	//display the result of inverting fraction 1 with the overloaded ~ opearator
	r1 != r1;
	cout << "Fraction 1 inverted: " << r1 << "\n";
}