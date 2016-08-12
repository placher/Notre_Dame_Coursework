#!/bin/sh

#verify that file is executable
if ! [ -x "timeout.py" ]; then
	echo "Error: timeout.py is not executable"
	exit 1
fi

#verify that shebang exists
if [ `grep -q '/usr/bin/env python2.7' 'timeout.py'` ]; then
	echo "Error: she-bang not found in timeout.py"
	exit 2
fi

#verify that usage information is printed to STDERR when -h is enabled
if [ `timeout.py -h 2>&1 | grep -q "."` ]; then
	echo "Error: timeout.py -h does not print usage information"
	exit 3
fi

#verify that timeout.py returns an exit status of 0 when successful
if  [ `timeout.py -t 5 sleep 1` ]; then
	echo "Error: timeout.py does not exit with successful status"
	exit 4
fi

#verify that timeout.py returns a nonzero exit status when unsuccessful
if  [ `timeout.py -t 1 sleep 5` ]; then
	echo "Error: timeout.py does not exit with failure status"
	exit 5
fi

#verify that timeout.py prints to STDERR when -v is enabled
if [ `timeout.py -t 1 -v sleep 3 2>&1 | grep -q "."` ]; then
	echo "Error: timeout.py -v does not print debugging information"
	exit 6
fi 

echo "Success"
exit 0