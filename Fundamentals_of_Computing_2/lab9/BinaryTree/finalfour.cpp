//FinalFour.cpp
//J. Patrick Lacher

//Simulates the Sweet-16 Onwards for the 2016 Men's NCAA Season based on Power-Rankings before the Sweet-16 Began

#include "BinaryTree.h"

using namespace std;

int main() {
	
	BinaryTree<int> tournament("tournament.txt");
	
	tournament.finalfour();
	
	cout << "Pre-Order Traversal:\n";
	
	tournament.preOrderTraversal();
	
	cout << "\nIn-Order Traversal:\n";
	
	tournament.inOrderTraversal();
	
	cout << "\nPost-Order Traversal:\n";
	
	tournament.postOrderTraversal();
	
	cout << "\n\nSearch for Data=8: \n";
	
	tournament.searchForValue(8);
	
}