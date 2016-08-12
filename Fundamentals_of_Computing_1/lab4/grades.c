#include <stdio.h>
#include <math.h>

int main(void){
	int grades[50]={0},i=0,temp;
	// takes a file as an input into a 50-cell array
	printf("Enter an array or a file of grades delimited by white-space: ");
	while (i <= 49){
		scanf("%d",&temp);
		if (temp < 0){
			break;
		}
		grades[i] = temp;
		i++;
	}
	for (i=0;i<=49;i++){
		printf("%d\n",grades[i]);
	}
	// takes the average
	double sum;
	int n=(sizeof(grades)/sizeof(grades[0]));
	for (i=0;i<n;i++){
		sum = sum + grades[i];
	}
	double avg=(sum/n);
	printf("The average is %lf \n",avg);
	//takes the standard deviation
	double variance=0;
	for (i=0;i<n;i++){
		variance = variance + pow((grades[i]-avg),2.0);
	}
	double stddev=(variance/n);
	printf("The standard deviation is %lf \n",sqrt(stddev));
}