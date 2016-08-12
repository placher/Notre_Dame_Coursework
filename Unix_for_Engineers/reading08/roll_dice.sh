#!/bin/sh

ROLLS=10
SIDES=6

while getopts r:s: name
do
	case $name in
		r)ROLLS=$OPTARG;;
		s)SIDES=$OPTARG;;
	esac
done

shift $(($OPTIND -1))

for num in $(seq 1 $ROLLS)
do
	shuf -i 1-$SIDES -n 1
done
