Reading 05
==========

1. Variables are used to store various types of data

	variable=1
	
2. Capturing the data of STDOUT can be useful in performing multi-step operations, especially when used to find things like lists of files

	variable=$(ls -l)
	
3. If statements are conditionals used to evaluate true/false propositions or the results of the test command

	if [5 > 4]; then
		echo "5 is greater than 4"
	fi
	
4. Case structures are used to compare a variable against a list of possible attributes/values

	case $variable in 
		[a-z] ) echo "the variable is a letter";;
		[0-9] ) echo "the variable is a number";;
	esac
	
5. For loops iterate over multiple values of a variable, performing a list of commands for each values

	for input in $@
	do
		echo input
	done
	
6. While loops iterate over a set of commands until a condition is no longer true

	variable = 1
	while [variable != 10]; do
		echo "variable = $variable"
		variable = $((variable + 1))
	done
	
7. Shell Functions allow the artificial creation of new commands through the scripting of a new function

	function(){
		echo "Hello, $USER"
		echo "You are located in $PWD"
	}
	
8. Trap commands call a command or function when certain signals are recieved by the script (typically different kill commands)

	trap "echo "are you trying to kill me?"" SIGHUP SIGINT SIGTERM
	
