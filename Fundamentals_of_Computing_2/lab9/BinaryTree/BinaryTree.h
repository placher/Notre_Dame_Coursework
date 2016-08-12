#ifndef TREE_H
#define TREE_H

#include <iostream>
#include <fstream>
#include <string>
#include "Node.h"

using namespace std;

template<typename T> class BinaryTree {
	
	public:
		
		//constructor
		BinaryTree(string filename);
		
		//traverse binary tree
		void preOrderTraversal() const;
		void inOrderTraversal() const;
		void postOrderTraversal() const;
		
		//search for specific value
		void searchForValue(const T) const;
		
		//print final four
		void finalfour();
		
	private:
		
		//top of tree
		Node<T> *rootPtr;
		
		//arrays of unsorted nodes
		Node<T> entries[16];
		Node<T> parent1[8];
		Node<T> parent2[4];
		Node<T> parent3[2];
		Node<T> root;
	
		//values from file
		string labels[16];
		T datas[16];
		
		//utility functions
		void renameParent( Node<T> * ) const;
		void preOrderHelper( Node<T> * ) const;
		void inOrderHelper( Node<T> * ) const;
		void postOrderHelper( Node<T> * ) const;
		int searchValueHelper( Node<T> *, const T ) const;
};

//constructor
template<typename T>
BinaryTree<T>::BinaryTree(string filename) {
	
	//read in data from file
	ifstream myfile;
	myfile.open( filename.c_str() );
	for (int i = 0; i < 16; i++ ) {
		
		myfile >> labels[i];
		myfile >> datas[i];
	}
	
	//create tree heiarchy
	for (int i = 0; i < 16; i++) {
		entries[i].setData( datas[i], labels[i] );
	}
	int j = 0;
	for (int i = 0; i < 8; i++) {
		parent1[i].setChildren( &entries[j], &entries[j+1]);
		j += 2;
		renameParent( &parent1[i] );
	}
	j = 0;
	for (int i = 0; i < 4; i++ ) {
		parent2[i].setChildren( &parent1[j], &parent1[j+1] );
		j += 2;
		renameParent( &parent2[i] );
	}
	j = 0;
	for (int i = 0; i < 2; i++ ) {
		parent3[i].setChildren( &parent2[j], &parent2[j+1] );
		j += 2;
		renameParent(&parent3[i]);
	}
	
	//create root
	root.setChildren( &parent3[0], &parent3[1] );
	renameParent( &root );
	rootPtr = &root;
}

//rename parent node to larger of two children
template<typename T>
void BinaryTree<T>::renameParent( Node<T> *ptr ) const {
	
	//if children are equal, set parent to left child
	if ( ptr->leftPtr->data == ptr->rightPtr->data ) {
		
		ptr->setData( ptr->leftPtr->data, ptr->leftPtr->label );
	}
	//if not equal, find larger child
	else {
		
		//left child is larger
		if ( ptr->leftPtr->data > ptr->rightPtr->data ) {
			
			ptr->setData( ptr->leftPtr->data, ptr->leftPtr->label );
		}
		//right child is larger
		else ptr->setData( ptr->rightPtr->data, ptr->rightPtr->label );
	}
}


//preorder traversal of tree
template<typename T>
void BinaryTree<T>::preOrderTraversal() const {
	
	preOrderHelper( rootPtr );
}

template<typename T>
void BinaryTree<T>::preOrderHelper( Node<T> *ptr ) const {
	
	//if pointer has associated data
	if ( ptr != 0 ) {
		
		//process node
		cout << ptr->label << " ";
		//traverse subtrees
		preOrderHelper( ptr->leftPtr );
		preOrderHelper( ptr->rightPtr );
	}
}

//inorder traversal of tree
template<typename T>
void BinaryTree<T>::inOrderTraversal() const {
	
	inOrderHelper( rootPtr );
}

template<typename T>
void BinaryTree<T>::inOrderHelper( Node<T> *ptr ) const {
	
	//if pointer has associated data
	if ( ptr != 0 ) {
		
		//traverse left subtree
		inOrderHelper( ptr->leftPtr );
		//process node
		cout << ptr->label << " ";
		//traverse right subtree
		inOrderHelper( ptr->rightPtr );
	}
}

//postorder traversal of tree
template<typename T>
void BinaryTree<T>::postOrderTraversal() const {
	
	postOrderHelper( rootPtr );
}

template<typename T>
void BinaryTree<T>::postOrderHelper( Node<T> *ptr ) const{
	
	//if pointer has associated data
	if ( ptr != 0 ) {
		
		//traverse subtreees
		postOrderHelper( ptr->leftPtr );
		postOrderHelper( ptr->rightPtr );
		//process node
		cout << ptr->label << " ";
	}
}

//search tree for specific value
template<typename T>
void BinaryTree<T>::searchForValue(const T value) const {
	
	if ( searchValueHelper( rootPtr, value) == 0 ) {
		
		cout << "Unable to find " << value << " in binary tree.\n";
	}
}

template<typename T>
int BinaryTree<T>::searchValueHelper( Node<T> *ptr, const T value ) const {
	
	if ( ptr != 0 ) {
		
		//found target data
		if ( ptr->data == value ) {
		
			cout << "Found target node:\n" << ptr->label << ": " << ptr->data << "\n";
			return 1;
		}
		//search deeper in the tree
		else {
		
			 if ( searchValueHelper( ptr->leftPtr, value ) ) return 1;
			 else if ( searchValueHelper (ptr->rightPtr, value ) ) return 1;
		}
	}
	
	return 0;
}

template<typename T>
void BinaryTree<T>::finalfour() {
	
	cout << "Champion: " << rootPtr->label << "\n\n";
	cout << "Final Four:" << "\n" << rootPtr->leftPtr->leftPtr->label << "\n";
	cout << rootPtr->leftPtr->rightPtr->label << "\n";
	cout << rootPtr->rightPtr->leftPtr->label << "\n";
	cout << rootPtr->rightPtr->rightPtr->label << "\n\n";
}

#endif