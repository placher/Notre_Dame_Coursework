Homework 05
===========

Activity 1
----------

1.

	The source sets for uppercase and lowercase letters were constructed by declaring variables ALPHABET and UALPHABET.
	$ ALPHABET="abcdefghijklmnopqrstuvwxyz"
	
2.

	The targes sets for uppercase and lowercase were constructed by cutting the SHIFT number of characters from the front of the ALPHABET string and appending them to the end of the shortened string.
	
3.

	These sets were used as the source and target sets in a pair of tr commands seperated by a pipe. First, all the lowercase letters are shifted to their complements in the target set, then the uppercase letters are shifted.
	
Activity 2
----------

1.

	To filter for only the relevant URLs, I used a grep command with the -o flag to include only matching data, and a regular expression describing URLs.
	'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'
	
2.

	If either of the sort flags were passed, the getopts case structure would create a variable SORTFLAG that would store the appropriate flags for sort, and its existence would trip an if statement that would add the sort command to the pipeline.
	
3.

	I describe above how the two sort flags are handled. The -n flag resets the HEADARG from 10 to the OPTARG of n. After any flags are handled, the program loops through all remaining arguments and executes the full pipeline for each of them, completing the desired functionality.
	
Activity 3
----------

1.

	Comments are removed by using the awk -F $DELIM '{print $1}' command, which, for each line, returns any portion of the line that appears before the delimiter stored in DELIM in instances where the -W flag hasn't been passed.
	
2.

	Empty lines were removed with the sed '/^\s*$/d' command, which deletes any lines that contain only spaces (ie. blank lines).
	
3.

	The two flags are read in through the getopts command, with the -d flag changing the existing DELIM variable to equal its $OPTARG, and the -W flag instantiating a new variable that directs the if statement later to choose a shortened pipeline that doesn't eliminate whitespace. The file upon which the operation is to be performed is redirected into broify.sh using standard I/O redirection.
	