Homework 03
===========

Activity 1
----------

1.

	A. libgcd.so is larger because it contains all of the information of gcd.o organized in a format that is easily referenceable by other programs, as opposed to libgcd.a, which only contains an unorganized copy of this information.
	
	B. gcd-static is larger because it contains an actual copy of all of the necessary files for operation, wheras gcd-dynamic merely contains a reference to thier locations in memory, referring to them as needed.
	
2.

	gcd-static depends on libgcd.a and gcd-dynamic depends on libgcd.so, which can be determined by looking at the associated rules in the makefile.
	
3.

	gcd-dynamic doesn't originally work when run because the executable cannot find the libgcd.so file.
	
	
4.

	Static executables generally take up more drive space, but are relatively idiotproof in their execution. Dynamic executables, on the other hand, take up much less space, but require a more cognisant user to deploy them with the correct enviroment settings.
	By default, I would use static-linked executables if the memory is available, as they are much easier to transfer and require less conscious thought from the user.

	
Activity 2
----------

1.

	I actually downloaded the file locally onto my laptop by clicking on the provided link and extracted it via WinRAR, mirroring it to the student machines through the use of OpenAFS.
	
2.

	You must add the -g and -gdwarf-2 flags to incorporate the relevant debugging symbols.
	Including these symbols increases the size of the executable, in this case increasing it from 7906 bytes to 11370 bytes.
	
3.

	1. The buffer in main was originally the wrong data type for fgets() and BUFSIZ is never defined or allocated, so a segmentation fault occurs as soon as fgets() is called.
	   This was rectified by allocating buffer as an array of chars sufficently large enough to handle the input, and replacing BUFSIZ with the hard-coded size of the buffer.
	
	2. The allocation of *back in line 27 of the original program points to a position in the stack one position past the end of the string, causing the rest of the function to access invalid memory locations.
	   I fixed this by subtracting 1 from *back in the assignment statement.
	
	3. The memory leakage problem was apparent in a cursory examination of the program, seeing that in line 10 (of the original program) malloc() was used to allocate memory without a corresponding free().
	   The problem was corrected by adding a free() statement at the end of the function.
	   
4.

	The hardest to notice was the misallocation of *back, simply because of how small of a difference it was from the correct allocation. The problem was easily apparent, though when a printf() statement was used to test the values of the pointers.
	The only way to avoid these bugs in the future is to try to be cognisant of exactly what location in the stack you are looking for and to use debugging print statements to ensure all your allocations are performed correctly.
	
Activity 3
----------

1.

	Contacted the Courier
	/afs/nd.edu/user15/pbui/pub/bin/COURIER
	Got Message: Hmm... you sure you put the package in the right place?
	
2.

	Examined the Courier's Code for DeadDrop References
	strings /afs/nd.edu/user15/pbui/pub/bin/COURIER 
	Found: /tmp/%s.deaddrop and an indication that the file shouldn't be accessable to everyone
	
3.

	Created a Secure DeadDrop File in the Indicated Directory
	nano /tmp/jlacher1.deaddrop
	deaddrop
	chmod 600 /tmp/jlacher1.deaddrop
	
4.

	Returned to the Courier
	/afs/nd.edu/user15/pbui/pub/bin/COURIER
	Got Message: Well, everything looks good... I'm not sure what 'deaddrop' means, but I'll pass it on.