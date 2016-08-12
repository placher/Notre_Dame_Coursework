final: final.o hellafunctions.o gfx5.o
	gcc final.o hellafunctions.o gfx5.o -lm -lX11 -o final

final.o: final.c hellafunctions.h
	gcc -c final.c -o final.o

hellafunctions.o: hellafunctions.c
	gcc -c hellafunctions.c -o hellafunctions.o

gfx5.o: gfx5.c
	gcc -c gfx5.c -o gfx5.o

clean:
	rm *.o final 