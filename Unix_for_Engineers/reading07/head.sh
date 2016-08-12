#!/bin/sh

NLINES=10

while getopts n: name
do
	case $name in
		n)NLINES=$OPTARG;;
	esac
done

shift $(($OPTIND -1))

awk -v nlines="$NLINES" '1; NR == nlines {exit}'