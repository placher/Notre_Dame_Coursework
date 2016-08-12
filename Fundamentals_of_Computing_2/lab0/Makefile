mortgage: mortgagemain.o mortgage.o
	g++ mortgagemain.o mortgage.o -o mortgage

mortgagemain.o: main.cpp mortgage.h
	g++ -c main.cpp -o mortgagemain.o

mortgage.o: mortgage.cpp
	g++ -c mortgage.cpp -o mortgage.o

clean:
	rm *.o mortgage 