Reading 01
==========

Question 1
----------

To create a private file, the **chmod** command is used to alter access permissions.

	$ chmod 600 [filename]

Question 2
----------

To create a link between directories, you use the **ln** command with the -s modifier.

	$ ln -s /afs/nd.edu/coursesp.16/cse/cse20189.01 [linkname]
	
Question 3
----------

The **ls** command displays many properties of files, including size in bytes, which is the second number shown.

	$ ls -l
	
Question 4
----------

The **du** command displays the dize of a passed directory, the -h modifier formats the output to be readable.

	$ du -h [filename]
	
Question 5
----------

Processes are ended with the **kill** command.

	$ kill -SIGTERM 25263
	
Question 6
----------

The **killall** command is used to terminate multiple processes simultaneously.

	$ killall -9 urxvt
	
Question 7
----------

The **time** command can be used to determine the life of a process.

	$ time simulation
	
Question 8
----------

To change the default editor, the following commands are entered.

	$ VISUAL=editor; export VISUAL
	$ EDITOR=editor; export EDITOR