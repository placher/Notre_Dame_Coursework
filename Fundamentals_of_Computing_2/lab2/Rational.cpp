//Rational.cpp
// J. Patrick Lacher

#include <iostream>
#include "Rational.h"

ostream & operator<<(ostream &output, Rational &B){
	output << B.getDecimal();
}

//Class Constructor
Rational::Rational(){
	//initialize the fraction
	numerator = 1;
	denominator = 1;
}

//overloading += operator
Rational Rational::operator+=(Rational n){
	if (denominator == n.denominator){
		numerator = numerator + n.numerator;
	}
	else{
		numerator = (numerator * n.denominator) + (n.numerator * denominator);
		denominator = denominator*n.denominator;
	}
	return (*this);
}

//overloading -= operator
Rational Rational::operator-=(Rational n){
	if (denominator == n.denominator){
		numerator = numerator - n.numerator;
	}
	else{
		numerator = (numerator * n.denominator) - (n.numerator * denominator);
		denominator = denominator*n.denominator;
	}
	return (*this);
}

//overloading *= operator
Rational Rational::operator*=(Rational n){
	numerator = numerator * n.numerator;
	denominator = denominator * denominator;
	return (*this);
}

//overloading /= operator
Rational Rational::operator/=(Rational n){
	numerator = numerator * n.denominator;
	denominator = denominator * n.numerator;
	return (*this);
}

//overloading != operator to invert a fraction
Rational Rational::operator!=(Rational n){
	numerator = n.denominator;
	denominator = n.numerator;
	return (*this);
}

//Member Functions

//Access Parts of the Fraction
int Rational::getNumerator(){
	return numerator;
}
int Rational::getDenominator(){
	return denominator;
}
double Rational::getDecimal(){
	return ((double)numerator/(double)denominator);
}

//Store a Fraction
int Rational::storeFraction(int num, int denom){
	while (denom == 0){
		cout << "Denominator can't be 0.\nFraction set to 1/1 \n";
		num = 1;
		denom = 1;
	}
	if ((num%denom) == 0){
		num = num/denom;
		denom = 1;
	}
	numerator = num;
	denominator = denom;
	return denom;
}