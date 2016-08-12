#include <stdio.h>

int identifycharacter(char);

int main(){
	int count[28] = {0},lcount = 0,i,j;
	char buffer[1000],filename[100];
	
	//get the name/path of a file from the user
	printf("Please enter the name/path of the file: ");
	scanf("%s",filename);
	
	//open the user-specified file
	FILE *ptr_file;
	ptr_file = fopen(filename,"r");
	
	//tests to ensure file opened correctly
	if (ptr_file == NULL){
		printf("Error in reading file\n");
		return 1;
	}
	
	//reads the file into the buffer 1000 characters at a time and increments the corresponding cell in the count array
	while (fgets(buffer,1000,ptr_file) != NULL){
		i=0;
		while (buffer[i] != '\0'){
			j = identifycharacter(buffer[i]);
			count[j]++;
			lcount++;
			i++;
		}
	}
	
	//print all of the characters and their respective counts to a table in stdout
	printf("a:\t%d\tb:\t%d\tc:\t%d\td:\t%d\te:\t%d\tf:\t%d\n",count[0],count[1],count[2],count[3],count[4],count[5]);
	printf("g:\t%d\th:\t%d\ti:\t%d\tj:\t%d\tk:\t%d\tl:\t%d\n",count[6],count[7],count[8],count[9],count[10],count[11]);
	printf("m:\t%d\tn:\t%d\to:\t%d\tp:\t%d\tq:\t%d\tr:\t%d\n",count[12],count[13],count[14],count[15],count[16],count[17]);
	printf("s:\t%d\tt:\t%d\tu:\t%d\tv:\t%d\tw:\t%d\tx:\t%d\n",count[18],count[19],count[20],count[21],count[22],count[23]);
	printf("y:\t%d\tz:\t%d\n",count[24],count[25]);
	
	//sum the counts of all letters
	j = 0;
	for (i=0;i<26;i++){
		j+=count[i];
	}
	
	//print summary information to stdout
	printf("There were %d letters\n",j);
	printf("There were %d whitespace characters\n",count[26]);
	printf("There were %d total characters\n",lcount);
	
	//calculate and print the whitespace percentage as a function of character count
	double whites = count[26];
	double percent =  ((whites/lcount)*100);
	printf("Whitespace percentage: %lf\%\n",percent);
	
	//end of program
	return 0;
}

int identifycharacter(char c){
	//takes as an argument a C character and determines the character's identity and corresponding value in the "count" array
	int i;
	//uppercase letters
	if (isupper(c)){
		i = c-'A';
	}
	//lowercase letters
	else if (islower(c)){
		i = c-'a';
	}
	//whitespace
	else if (isspace(c)){
		i = 26;
	}
	//other characters
	else{
		i = 27;
	}
	return i;
}