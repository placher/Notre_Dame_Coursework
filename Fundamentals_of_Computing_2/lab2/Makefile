rational: rationalmain.o rational.o
	g++ rationalmain.o rational.o -o rational

rationalmain.o: main.cpp Rational.h
	g++ -c main.cpp -o rationalmain.o

rational.o: Rational.cpp Rational.h
	g++ -c Rational.cpp -o rational.o

clean:
	rm *.o rational 