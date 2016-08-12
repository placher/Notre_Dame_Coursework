Homework 07
===========

Activity 1
----------

1. To parse the command line options, I used a for loop to loop over sys.argv[1:] to get individual arguments, then split the argument across the "=" to get the data. For example:
	
	tvar = arg.split("=")
	bytes = int(tvar[1])
	
2. The files were opened with the os.open() function, using the os.O_RDONLY (read-only) flag for the input file and os.O_RDWR|os.O_CREAT (read-write/create) flags for the output file.

3. The seek and skip arguments were used as the [pos] argument in os.lseek() when stdin/stdout were not being used

	if ifile != 0:
		os.lseek(ifile,skip,0)
	if ofile != 1:
		os.lseek(ofile,seek,0)

4. Bs is used as the second argument of os.read() to limit the ammound of if read at a time. Count is used as the maximum value of an internal counter for the number of copies of size bs that have been executed.

Activity 2
-----------

1. To parse the command line data, I took sys.argv[1] as the root directory for the search and looped over the rest of the arguments with a for loop, activating an internal marker every time a new flag appeared to record the next argument as the appropriate input.

	if "-type" in arg:
		ftype = 1
	elif ftype == 1:
		type = arg
		ftype = 0

2. The directory tree was traversed using the os.walk() function contained within a for loop, directing the output to root, dirs, and files.

	for root, dirs, files in os.walk(directory,topdown=True,followlinks=True):

3. Whether or not to print a filepath is determined by the include() function, which checks the passed path against any active conditions passed on the command line, returning a boolean decision whether or not the argument satisfies all active conditions.

4. By default, find ignores symbolic links, treating them as a file and not as a future destination, so lstat is never called. Find also seems to retain a certain ammound of information about previous positions, innoculating it from dead-end errors and some infinite loops. Find also appears to begin stat calls while parsing the command line, which improves its response time and efficency.