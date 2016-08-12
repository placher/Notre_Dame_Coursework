connectfour: c4main.o c4board.o c4col.o
	g++ c4main.o c4board.o c4col.o -o connectfour

c4main.o: c4main.cpp c4board.h
	g++ -c c4main.cpp -o c4main.o

c4board.o: c4board.cpp c4col.h
	g++ -c c4board.cpp -o c4board.o
	
c4col.o: c4col.cpp
	g++ -c c4col.cpp -o c4col.o

clean:
	rm *.o connectfour 