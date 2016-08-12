//language.cpp
//J. Patrick Lacher

/* Compares the words in a text file against the 10,000 most common words in English and Spanish in an attempt to
identify the language in which the text file was written */

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
	
	//variable declaration
	string filename;
	string name;
	vector<string> engdict;
	vector<string> espdict;
	string buffer;
	int english = 0;
	int spanish = 0;
	
	//build english dictionary
	ifstream englishdictionary;
	name = "english.txt";
	englishdictionary.open( name.c_str() );
	while ( true ) {
		
		//read word from dictionary file
		englishdictionary >> buffer;
		if ( englishdictionary.eof() ) break;
		
		//remove any punctuation
		buffer.erase( remove_if( buffer.begin(), buffer.end(), ::ispunct ), buffer.end() );
		
		//convert to all lowercase
		transform( buffer.begin(), buffer.end(), buffer.begin(), ::tolower);
		
		//add word to dictionary
		engdict.push_back( buffer );
	}
	englishdictionary.close();
	
	//build spanish dictionary
	ifstream spanishdictionary;
	name = "spanish.txt";
	spanishdictionary.open( name.c_str() );
	while ( true ) {
		
		//read word from dictionary file
		spanishdictionary >> buffer;
		if ( spanishdictionary.eof() ) break;
		
		//remove any punctuation
		buffer.erase( remove_if( buffer.begin(), buffer.end(), ::ispunct ), buffer.end() );
		
		//convert to all lowercase
		transform( buffer.begin(), buffer.end(), buffer.begin(), ::tolower);
		
		//add word to dictionary
		espdict.push_back( buffer );
	}
	spanishdictionary.close();
	
	//get name of file from user
	cout << "Enter name of file: ";
	cin >> filename;
	cout << "\n";
	
	//read text from file and determine if it is english or spanish
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
		
		//check english dictionary for match
		if ( find( engdict.begin(), engdict.end(), buffer ) != engdict.end() ) {
			
			//word was found in english dictionary
			english++;
		}
		
		//check spanish dictionary for match
		if ( find( espdict.begin(), espdict.end(), buffer ) != espdict.end() ) {
			
			//word was found in spanish dictionary
			spanish++;
		}
	}
	
	//print results
	if ( english > spanish ) {
		
		cout << filename << " is likely in English.\n";
	}
	else if ( spanish > english ) {
		
		cout << filename << " is likely in Spanish.\n";
	}
	else {
		
		cout << "Language of " << filename << " could not be identified.\n";
	}
	
}