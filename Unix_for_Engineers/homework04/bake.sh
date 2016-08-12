!#/bin/sh

set -e

for f in $(ls *${SUFFIXES:=".c"})
do
	${CC:=gcc} ${CFLAGS:="-std=gnu99 -Wall"} $f -o $(basename $f ${SUFFIXES:=".c"})
	if [ -n "${VERBOSE+1}" ]; then
		echo $CC $CFLAGS $f -o $(basename $f ${SUFFIXES:=".c"})
	fi
done
