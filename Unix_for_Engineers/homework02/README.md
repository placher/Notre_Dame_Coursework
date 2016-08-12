Homework 02
===========

Activity 01
-----------

1.

	# Create the workspace on the source machine
	$ mkdir /tmp/jlacher1-workspace
	
	# Create the garbage file using the dd command
	$ dd if=/dev/urandom of=10M bs=10000000 count=1
	
	# Create hard links to the garbage file
	$ ln 10M data0
	$ ln 10M data1
	$ ln 10M data2
	$ ln 10M data3
	$ ln 10M data4
	$ ln 10M data5
	$ ln 10M data6
	$ ln 10M data7
	$ ln 10M data8
	$ ln 10M data9
	
	# Workspace on target machine was created by ssh-ing into another machine in a seperate terminal window and using the command above
	
2.

	10004096 bytes
	No it's not supprising. The 10Mb file takes up most of the space and the data* files are simply links to the location of 10Mb in the memory, not copies
	
3.

	100004096 bytes
	The number is different, specifically 10 times larger, because the file transfer programs moved the linked file (10M) every time one of the data links was moved, resulting in 100Mb of disk usage instead of 10Mb
	
4.

	# Transfer data files using scp
	$ scp {data*} jlacher1@student00.cse.nd.edu:/tmp/jlacher1-workspace
	
	# Transfer data files using sftp
	$ sftp jlacher1@student00.cse.nd.edu
	$ cd /tmp/jlacher1-workspace
	$ put data*
	
	# Transfer data files using rsync
	$ rsync data* jlacher1@student00.cse.nd.edu:/tmp/jlacher1-workspace
	
5.

	Each data file is transferred every time scp or sftp is called, wheras files are only transferred by rsync when a change is detected.
	This is incredibly useful as it helps minimize waiting time and bandwith when large files/groups are being transferred, only moving the files that have to move.
	
6.

	Scp and rsync are relatively similar in their simple syntax, but I'd probably have to go with rsync for its ability to filter out redundant sent files.
	

Activity 2
----------

1. Scan 'xavier.h4x0r.space' for HTTP port:

	$ nmap -Pn xavier.h4x04.space
	Port 9111/tcp open DragonIDSConsole
	Port 9876/tcp open 
	
2. Access HTTP server:

	$ wget xavier.h4x0r.space:9876
	Downloaded a file describing where to find password
	
3. Decode passcode

	$ base64 -d ~pbui/pub/oracle/jlacher1/code
	54c7bd910419dc3b6d04565909eface9
	
4. Remessage server with new credentials

	$ wget xavier.h4x0r.space:9876/jlacher1/54c7bd910419dc3b6d04565909eface9
	Downloaded a file with instructions to message a file in the instructor's active directory
	
5. Killed the file in the instructor's directory

	$ ~pbui/pub/oracle/SLEEPER
	$ ^Z
	$ bg
	$ pkill -1 SLEEPER
	The program returned a message to be sent to the oracle: d3lucHVyZTE9MTQ1NDAzNDkyOQ==
	
6. Passed the message to the oracle

	$ telnet xavier.h4x0r.space 9111
	$ jlacher1
	$ d3lucHVyZTE9MTQ1NDAzNDkyOQ==
	The oracle complimented me on my unix skills, but I was not convinced.