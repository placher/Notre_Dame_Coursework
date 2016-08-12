//findsimilar.cpp
//J. Patrick Lacher

//Finds a list of all unique words in a file, then returns the frequency of their occurances in a second file.

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
	
	//variable declaration
	string filename;
	string filename2;
	string buffer;
	vector<string> dictionary;
	vector<string> found;
	vector<string> found_count;
	int position;
	int i, j;
	int count;

	//get name of first file from user
	cout << "Enter name of file 1: ";
	cin >> filename;
	cout << "\n";

	//read in data from file 1
	ifstream myfile;
	myfile.open( filename.c_str() );
	while ( true ) {
		
		//read new word from file and break if end of file has been reached
		myfile >> buffer;
		if( myfile.eof() ) break;
		
		//remove any punctuation
		buffer.erase( remove_if( buffer.begin(), buffer.end(), ::ispunct ), buffer.end() );
		
		//convert to all lowercase
		transform( buffer.begin(), buffer.end(), buffer.begin(), ::tolower);
		
		//add word to dictionary
		dictionary.push_back( buffer );
	}
	myfile.close();
	
	//remove duplicate values
	vector<string>::iterator it;
	it = unique( dictionary.begin(), dictionary.end() );
	dictionary.resize( distance( dictionary.begin(), it ) );
	
	//report number of unique words in file 1
	cout << dictionary.size() << " unique words found in " << filename << "\n\n";
	
	//get name of second file from user
	cout << "Enter name of file 2: ";
	cin >> filename2;
	cout << "\n";
	
	//read in data from file 2
	ifstream secondfile;
	secondfile.open( filename2.c_str() );
	while ( true ) {
		
		//read new word from file
		secondfile >> buffer;
		if ( secondfile.eof() ) break;
		
		//remove any punctuation
		buffer.erase( remove_if( buffer.begin(), buffer.end(), ::ispunct ), buffer.end() );
		
		//convert to all lowercase
		transform( buffer.begin(), buffer.end(), buffer.begin(), ::tolower);
		
		//detect if word appears in dictionary
		if ( find( dictionary.begin(), dictionary.end(), buffer ) != dictionary.end() ) {
			
			found.push_back( buffer );
			found_count.push_back( buffer );
		}
	}
	secondfile.close();
	it = unique( found.begin(), found.end() );
	dictionary.resize( distance( found.begin(), it ) );
	
	
	//report all of the common words found in file 2
	cout << "All words in " << filename2 << " that also appear in " << filename << ":\n\n";
	for ( i = 0; i < found.size(); i++ ) {
		
		count = 0;
		
		//count word frequency
		for ( j = 0; j < found_count.size(); j++ ) {
			
			if ( found_count[j] == found[i] ) count++;
		}
		
		//print each word and its associated count
		cout << found[i] << ": " << count << "\n";
	}
	cout << "\n";
}