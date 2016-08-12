Reading 03
==========

1.

	$ strings /bin/ls
	
2.

	$ ldd /bin/ls
	
3.

	$ strace ls
	
4.

	$ gdb hello-debug
	$ r
	$ q
	
5.

	$ valgrind --leak-check=yes hello-dynamic
	
6.

	$ gprof hello-profile > hello-profile.output