CC=		gcc
CFLAGS=	 -g -c $< -o $@
LD=		gcc
LDFLAGS=	$^ -o $@
AR=		ar
ARFLAGS=	rcs $@ $^
TARGETS=	gcd-static gcd-dynamic

all: $(TARGETS)

libgcd.a: gcd.o
	$(AR) $(ARFLAGS)

libgcd.so: gcd.o
	$(CC) -shared $^ -o $@

gcd-static: main.o libgcd.a
	$(LD) $(LDFLAGS) -static

gcd-dynamic: main.o libgcd.so
	$(LD) $(LDFLAGS)

main.o: main.c
	$(CC) $(CFLAGS)
	
gcd.o: gcd.c
	$(CC) $(CFLAGS)

clean:
	rm -f $(TARGETS) *.o *.a *.so