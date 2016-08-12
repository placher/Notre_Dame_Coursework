#!/bin/sh

HEADARG=10

while getopts rsn: name
do
	case $name in
		r)SORTFLAG="-R";;
		s)SORTFLAG="-b";;
		n)HEADARG=$OPTARG;;
	esac
done

shift $(($OPTIND -1))

if [ ! -z $SORTFLAG ]; then
	for sub in $@
	do
		echo "r/$sub"
		echo ""
		curl -s "http://www.reddit.com/r/$sub/.json" | python -m json.tool | grep -Eo 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'| sort $SORTFLAG | head -n $HEADARG
		echo ""
	done
else
	for sub in $@
	do
		echo "r/$sub"
		echo ""
		curl -s "http://www.reddit.com/r/$sub/.json" | python -m json.tool | grep -Eo 'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'| head -n $HEADARG
		echo ""
	done
fi