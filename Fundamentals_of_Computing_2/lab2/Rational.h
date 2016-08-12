//Rational.h
//J. Patrick Lacher

#include <iostream>

using namespace std;

class Rational{
	//overloads << operator
	friend ostream & operator<<(ostream &,Rational &);
	
	public:
	
		//class constructor
		Rational();
	
		//get parts of the fraction
		int getNumerator();
		int getDenominator();
		double getDecimal();
		
		//store a fraction in the class
		int storeFraction(int,int);
		
		//overloaded math operators
		Rational operator+=(Rational);
		Rational operator-=(Rational);
		Rational operator*=(Rational);
		Rational operator/=(Rational);
		Rational operator!=(Rational);
	
	private:
	
		int numerator;
		int denominator;
	
};