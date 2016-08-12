#ifndef NODE_H
#define NODE_H

#include <string>

using namespace std;

template<typename T> class BinaryTree; // forward declaration of Binary Tree

template<typename T>   // templated node type
class Node {

	friend class BinaryTree< T >;    // make the main class a friend

	public:
	
		//constructor
		Node();
		//change name/data
		void setData( T, string name);
		//change children pointers
		void setChildren( Node< T > *, Node< T > * );

	private:
		T data;           // data for binary tree node
		Node<T> *leftPtr;    // pointer to left object
		Node<T> *rightPtr;	  // pointer to right object
		string label;	  // label for the node
};

// constructor
template<typename T>
Node< T >::Node() :data('0'),leftPtr(0),rightPtr(0),label("Filler") {}

//change name/data
template<typename T>
void Node< T >::setData( T value, string name ) {
	
	data = value;
	label = name;
}

//change children
template<typename T>
void Node< T >::setChildren( Node< T > *left, Node< T > *right) {
	
	leftPtr = left;
	rightPtr = right;
}

#endif