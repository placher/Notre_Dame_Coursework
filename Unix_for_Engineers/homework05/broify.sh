#!/bin/sh

DELIM="#"

while getopts Wd: name
do
	case $name in
		d)DELIM=$OPTARG;;
		W)IGNORELINES="yes";;
	esac
done

shift $(($OPTIND -1))

if [ ! -z $IGNORELINES ]; then
	awk -F $DELIM '{print $1}' | sed 's/[ \t]*$//'
else
	awk -F $DELIM '{print $1}' | sed 's/[ \t]*$//' | sed '/^\s*$/d'
fi