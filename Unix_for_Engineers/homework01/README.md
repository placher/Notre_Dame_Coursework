Homework 01
===========

Exercise 01
-----------

1.
	
	$ cd /afs/nd.edu/user14/csesoft
	
2.
	
	$ cd ../../user14/csesoft
	
3.
	
	$ cd ~/../../user14/csesoft
	
4.
	
	$ ln -s /afs/nd.edu/user14/csesoft csesoft
	
	
Exercise 02
-----------

1.
	
	$ mkdir images
	$ cp -a /usr/share/pixmaps/* images
	
2.
	
	yes. In putty they are flagged as a different color.
	
3.
	
	$ mv images pixmaps
	time = 0.002s
	
4.
	
	$ mv pixmaps /tmp/jlacher1-pixmaps
	time = 0.123s
	This is slower because the system must create/access the /tmp directory instead of simply renaming the directory
	
5.
	
	$ rm -r /tmp/jlacher1-pixmaps
	time = 0.007s
	This command is much faster because the system only has to erase files, as opposed to erasing the old copy and creating a new one at the target directory

	
Exercise 03
-----------

1.
	
	$ ls -alh /afs/nd.edu/user37/ccl/software
	
2.
	
	$ ls -alht /afs/nd.edu/user37/ccl/software
	
3.
	
	1937
	$find /afs/nd.edu/user37/ccl/software/cctools/x86_64 -type f | wc -l
	
4.
	
	Yes, the directory does contain the desired executable
	$ find /afs/nd.edu/user37/ccl/software -executable -name 'weaver'
	
5.
	
	redhat5 is 77Mb
	$ du -hs /afs/nd.edu/user37/ccl/software/cctools/x86_64/* | sort -rn | head -n1
	
6.
	
	799
	$ find /afs/nd.edu/user37/ccl/software/cctools/x86_64/redhat5 | wc -l
	
7.
	
	redhat6/lib/libconfuga.a is 1022Kb
	$ du -ha /afs/nd.edu/user37/ccl/software/cctools/x86_64 | sort -rn | head -n1
	
8.
	
	2026
	$ find /afs/nd.edu/user37/ccl/software/cctools/x86_64 -mtime +30 | wc -l
	
	
Exercise 04
-----------

1.
	
	Owner can read, write, and execute
	Group can read, and execute
	Everyone can execute
	
2.
	
	a.
	
		$ chmod 711 data.txt
		
	b.
	
		$ chmod 770 data.txt

	c.
	
		$ chmod 004 data.txt
		
	d.

		$ chmod 777 data.txt
		
3.
	
	If the file has no permissions, anyone can delete the file
	
	
Exercise 05
-----------

1.
	
	Home Directory:
		nd_campus can look
		system administrators have all permissions
		authorized users can look
		owner has all permissions
	Private:
		system administrators have all permissions
		owner has all permissions
	Public:
		nd_campus can read, look, and lock
		system administrators have all permissions
		authorized users can read, look and lock
		owner has all permissions
		
2.
	
	nd_campus can read and look
	system administrators have all permissions
	authorised users can read and look
	
	The system returns an error that the user only had read permissions
	
3.
	
	$ fs setacl -clear -dir ~/folder -acl jlacher1 pbui rlidwka
	
	
Exercise 06
-----------

world1.txt
	
	everyone can do everything
	
	
world2.txt
	
	owner can do everything
	everyone can read but not write

	
world3.txt
	
	owner can do everyting
	everyone can write but not read