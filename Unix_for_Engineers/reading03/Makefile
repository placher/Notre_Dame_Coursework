all: hello-dynamic hello-static hello-debug hello-profile

hello-dynamic: hello.c
	gcc hello.c -o hello-dynamic

hello-static: hello.c
	gcc hello.c -o hello-static -static
	
hello-debug: hello.c
	gcc hello.c -o hello-debug -g

hello-profile: hello.c
	gcc hello.c -o hello-profile -pg

clean:
	rm hello-*