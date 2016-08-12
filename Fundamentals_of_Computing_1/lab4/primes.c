#include <stdio.h>

int main(void){
	int numbers[1000]={0},i,j,k=0;
	for (i=2;i<=100;i++){
		if (numbers[i]==0){
			for (j=(i*i);j<=1000;j+=i){
				numbers[j]=1;
			}
		}
	}
	for (i=1;i<=1000;i++){
		if (numbers[i]==0){
			printf("%d\t",i);
			k++;
			if (k==10){
				printf("\n");
				k = 0;
			}
		}
	}
	printf("\n");
}