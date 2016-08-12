!#/bin/sh

DUARGS="-h"

DUSORT="sort -h -r"

while getopts an: name
do
	case $name in
		a)DUARGS="-h -a";;
		n)nopt=$OPTARG;;
		*) echo usage: disk_usage.sh [-a -n N] directory...;;
	esac
done

shift $(($OPTIND -1))

if [ ! -z $nopt ]; then
	for file in $@
	do
		du 2>/dev/null $DUARGS $file | $DUSORT | head -n $nopt
	done
else
	for file in $@
	do
		du 2>/dev/null $DUARGS $file | $DUSORT
	done
fi
