all: packages

packages: main.o OvernightPackage.o TwoDayPackage.o Package.o
	g++ main.o OvernightPackage.o TwoDayPackage.o Package.o -o packages
	
main.o: main.cpp OvernightPackage.h TwoDayPackage.h
	g++ -c main.cpp -o main.o

OvernightPackage.o: OvernightPackage.cpp Package.h
	g++ -c OvernightPackage.cpp -o OvernightPackage.o
	
TwoDayPackage.o: TwoDayPackage.cpp Package.h
	g++ -c TwoDayPackage.cpp -o TwoDayPackage.o
	
Package.o: Package.cpp
	g++ -c Package.cpp -o Package.o
	
clean:
	rm packages *.o