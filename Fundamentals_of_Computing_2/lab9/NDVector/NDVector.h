//NDVector.h
//J. Patrick Lacher

//Simulates Vector with Dynamic Arrays

#ifndef NDVECTOR_H
#define NDVECTOR_H

using namespace std;

template <typename T>
class NDVector {
	
	public:
	
		//defualt constructor
		NDVector( int = 10 );
		//copy constructor
		NDVector( const NDVector & );
		//deconstructor
		~NDVector();
		
		//overloaded = operator
		NDVector &operator=( const NDVector<T> &);
		//overloaded [] operator
		T& operator[](int offset) const{ return ptr[offset];}
		
		//add to back
		void push_back(T);
		//remove from back
		void pop_back();
		
		//size of the vector
		int getSize() const;
		
		//access last element
		T back();
		
		//clear array
		void clear();
		
		//print contents of the vector
		void print();
		
	private:
		
		//the array
		T *ptr;
		//size of the array
		int size;
		int capacity;
};

//default constructor
template <typename T>
NDVector<T>::NDVector( int arraySize ) {

	//validate size
	size = ( arraySize > 0 ? arraySize : 10 );
	//allocate space
	ptr = new T[ size ];
	capacity = size;
	size = 0;
}

//copy constructor
template <typename T>
NDVector<T>::NDVector( const NDVector<T> &arrayToCopy )  : size( arrayToCopy.size ) {

	//allocate space
	ptr = new T[ size ];
	//fill array
	for ( int i = 0; i < size; i++ ) ptr[ i ] = arrayToCopy.ptr[ i ];
}

//deconstructor
template <typename T>
NDVector<T>::~NDVector() {
	
	delete [] ptr;
}

//overloaded = operator
template<typename T>
NDVector<T> &NDVector<T>::operator=( const NDVector<T> &right ) {

	if ( &right != this ){ 
		if ( size != right.size ){
			//delete old array
			delete [] ptr;
			//correct size
			size = right.size;
			//allocate new array
			ptr = new T[ size ];	
		}
		//fill array
		for ( int i = 0; i < size; i++ ) ptr[ i ] = right.ptr[ i ];
	}
}

//get size of array
template<typename T>
int NDVector<T>::getSize() const  {

	return (size);
}

//add to back of array
template<typename T>
void NDVector<T>::push_back(T value) {
	
	T *tptr;
	
	if (capacity < size ) capacity = size * 2;
	
	//create temp array
	tptr = new T[ capacity ];
	
	//copy old array to temp and deallocate
	for ( int i = 0; i < size; i++ ) tptr [ i ] = ptr[ i ];
	tptr [ size + 1 ] = value;
	size += 1;
	ptr = tptr;
}

//delete from back of array
template<typename T>
void NDVector<T>::pop_back() {
	
	size -= 1;
	ptr[size] = NULL;
}

//access last element
template<typename T>
T NDVector<T>::back() {
	
	return ptr[size - 1];
}

//clear array
template<typename T>
void NDVector<T>::clear() {
	
	//set size to 0 and remove ptr;
	size = 0;
	ptr = new T[0];
}

//print contents of the array
template<typename T>
void NDVector<T>::print() {
	
	for (int i = 0; i < size; i++ ) {
		cout << ptr[i] << " ";
	}
	cout << endl;
}

#endif