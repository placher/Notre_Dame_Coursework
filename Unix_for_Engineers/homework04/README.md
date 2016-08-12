Homework 04
===========

Activity 01
-----------

1.

	A. Variables were set either externally with the set command ($set SUFFIXES=.c) or internally with parameter expansion (${SUFFIXES:=".c"})
	B. I used a for loop iterating over all files in $(ls *$SUFFIXES) which returns all files in the current directory with the given suffix
	C. Verbose was tested for existance with [ -n "${VERBOSE+1}" ] which is true when verbose exists and false otherwise
	D. The script is killed automatically upon error using the (set -e) built-in function
	
2.

	Using bake.sh is similar to make and can be useful in that it limits the ammount of verbose information appearing on the terminal, and it is useful for a single file being compiled.
	Where make is useful, though, is both in its ability to compile only the parts of large programs that have been updated, and in the error protection that bake.sh lacks (there can be problems if source files aren't perfect)
	I think I'll stick with the precision of make, though bake.sh is a useful tool.
	
Activity 02
-----------

1.

	A. The command line arguments are parsed with the getopts function, which loops all of the option flags and their arguments through a case structure that makes alterations to the "templated" arguments for du. The shift statement sets the first directory as $1, then the remaining arguments are looped over with the flagged settings for du.
	B. In the case where there are no command line arguments, the getopt search echoes the proper usage for the script.
	C. The program loops over each directory argument in $@ with a for loop and runs the full du command corresponding to the passed flags.
	D. If the "-a" flag is passed, the script appends "-a" to the string of flags passed to du. If the "-n" flag is passed, the script gets the argument of "-n" and pipes the output of the du | sort to a head command with "-n $nopt" as its arguments.
	
2.

	The hardest part of writing this script was probably working out what the "template" for what the ultimate command looked like because some of the options add different commands to the line.
	Actually running the command took more code than parsing all of the arguments, which makes sense since I need multiple for loops to implement all of the possible versions of the du command.
	
Activity 03
-----------

1.

	A. The various signals are read by two trap commands that print unique cowsay text for the various signals. One tests for SIGHUP, while the other tests for SIGINT and SIGTERM.
	B. I passed my strings with an echo command inline with the trap command. To pass longer messages, you could use a bourne function as the command argument of trap.
	C. After the original message is printed, the command sleeps for 10 seconds, using a set of sleep commands. If the script isn't killed by one of the trap commands, another cowsay instance is called with a timeout command.
	
2.

	From a conceptual standpoint, writing scripts is similar to writing in C. The difference is in the operating dimensions: programs in C are contained internally within the compile, while shell scripts are a series of commands that are passed externally to the terminal.
	Running C can be a little easier, as the compiler flags mistakes without actually running the program. A problem in a script can cause some major issues if it changes the meaning of a command.
	Shell scripts and C are both useful in different situations. C is more useful for computational purposes and shell scripts are useful for functions involving operations on files on the system.