#include <stdio.h>

int main() {
	//collect basic data on the mortgage
	double balance; //begins as the principal
	double intrate; //interest rate
	double payment; //desired monthly payment
	printf("\n");
	printf("Enter the value of the loan:  ");
	scanf("%lf", &balance);
	printf("Enter the interest rate on the loan as a decimal \(5\% = 0.05):  ");
	scanf("%lf", &intrate);
	printf("Enter the amount of the desired monthly payment:  $");
	scanf("%lf", &payment);
	
	//check for invalid inputs
	if (intrate < 0.){
		printf("Error: Interest rate cannot be negative\n");
		return 0;
	}
	if (payment < 0.){
		printf("Error: Desired payment cannot be negative\n");
		return 0;
	}
	if (payment > balance){
		printf("Error: Desired payment cannot be greater than the principal loan value\n");
		return 0;
	}
	if (payment < (balance*intrate)){
		printf("Error: Desired payment cannot be less than monthly interest\n");
		return 0;
	}
	
	double totalpayment = 0.0; //initializes a variable to track total amount paid
	double months = 0; //initializes a variable to track how many months it takes to pay off the loan
	double interest; //initializes a variable to measure interest accrued each month
	
	//generate table
	printf("Month\tPayment  \tInterest  \tBalance\n");
	while (balance > 0.01){
		interest = intrate*balance;
		balance += interest;
		if (balance < payment){
			payment = balance;
		}
		balance = balance - payment;
		months += 1;
		totalpayment += payment;
		printf("%4.lf  \t$%.2lf  \t$%.2f  \t$%.2lf\n",months,payment,interest,balance);
	}
	printf("\n");
	printf("You paid a total of $%.2lf over %.3lf years\n",totalpayment,(months/12));
return 0;
}