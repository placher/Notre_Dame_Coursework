TLDR - kill
==========

Overview
--------

[kill] terminates a sepcified process

Examples
--------

- the **safe** way to end a process

	$ kill -SIGTERM pid
	
- the **brute force** way to end a process

	$ kill -SIGKILL pid
		
Resources
---------

- [Man 7](http://man7.org/linux/man-pages/man1/kill.1.html)