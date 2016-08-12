#include <stdio.h>
#include <string.h>

// We know that a pandigital prime can be at most 7 digits long, because
// 9+8+7+6+5+4+3+2+1 = 45 (divisible by 3)
// and 8+7+6+5+4+3+2+1 = 36 (also divisible by 3)
// hence, the largest pandigital prime must be 7654321 or less.

// To find the largest pandigital prime, the easiest method is to look at
// all the numbers below 7654321 and test them for pandigitality and primeness.

// By proceeding through a decreasing list, the first correct result we find
// will be the largest pandigital prime. For this, we need to declare two new
// functions: one to test for primes and one to test pandigitality.

// Tests a passed integer for primeness by dividing it by all integers below it
// and analysing the remainder. If the remainder is 0 for any number other than
// itself, the number is not prime.
int is_prime(int n){
	int i;
	for (i=2;i<n;i++){
		if (n % i == 0 && i != n){
			return 0;
		}
	}
	return 1;
}

// Converts a passed 7-digit number to a string and tests to ensure that there
// is only one occurrence of each integer [1,7].
int pandigital(int n){
	char num[7];
	sprintf(num,"%d",n);
	int i,x;
	for (i=0;i<7;i++){
		if (num[i] == '8' ^ num[i] == '9' ^ num[i] == '0'){
			return 0;
			break;
		}
	}
	for(i=0;i<7;i++){
		for (x=0;x<7;x++){
			if (num[i] == num[x] && i != x){
				return 0;
				break;
			}
		}
	}
	return 1;
}

int main(void){
	int i;
	// We know there are no even prime numbers, so they can be excluded in this search
	for (i=7654321;i>0;i-=2){
		if (pandigital(i) && is_prime(i)){
			printf("The largest pandigital prime is: %d \n",i);
			break;
		}
	}
}