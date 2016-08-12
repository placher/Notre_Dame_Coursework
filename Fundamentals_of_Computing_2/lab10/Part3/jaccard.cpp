//jaccard.cpp
//J. Patrick Lacher

/*
Compares two documents and computes the Jaccard Similarity 

If the two documents are identical, the result will be a Jaccard Index of 1.

It the two documents are not identical, the result will be a decimal reflecting the Jaccard Index (similarity)
of the two documents.

In the case of the two example documents, the Jaccard Index is 0.213836 when run with both documents, and 1 when run
on one of the documents as both inputs.
*/

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <set>
#include <algorithm>
#include <iterator>

using namespace std;

int main() {
	
	//variable declaration
	string filename1;
	string filename2;
	set <string> file1;
	set <string> file2;
	vector <string> s_intersected;
	string buffer;
	double jaccard;
	double isize;
	double usize;
	
	//get name of first file from user
	cout << "Enter name of first file: ";
	cin >> filename1;
	cout << "\n";

	//get first document
	ifstream firstfile;
	firstfile.open( filename1.c_str() );
	while ( !firstfile.eof() ) {
		
		//read word from file
		firstfile >> buffer;
		
		//remove any punctuation
		buffer.erase( remove_if( buffer.begin(), buffer.end(), ::ispunct ), buffer.end() );
		
		//convert to all lowercase
		transform( buffer.begin(), buffer.end(), buffer.begin(), ::tolower);
		
		//add word to vector
		file1.insert( buffer );
	}
	firstfile.close();
	
	//get name of second from user
	cout << "Enter name of second file: ";
	cin >> filename2;
	cout << "\n";
	
	//get second document
	ifstream secondfile;
	secondfile.open( filename2.c_str() );
	while ( !secondfile.eof() ) {
		
		//read word from file
		secondfile >> buffer;
		
		//remove any punctuation
		buffer.erase( remove_if( buffer.begin(), buffer.end(), ::ispunct ), buffer.end() );
		
		//convert to all lowercase
		transform( buffer.begin(), buffer.end(), buffer.begin(), ::tolower);
		
		//add word to vector
		file2.insert( buffer );
	}
	secondfile.close();

	
	//compute size of intersection of files
	set_intersection( file1.begin(), file1.end(), file2.begin(), file2.end(), back_inserter( s_intersected ) );
	isize = s_intersected.size();
	
	//compute size of union of files
	usize = ( file1.size() + file2.size() - isize );
	
	//compute jaccard index
	jaccard = ( isize / usize );
	
	//print results
	cout << "The Jaccard Index of " << filename1 << " and " << filename2 << " is: " << jaccard << "\n\n";
}