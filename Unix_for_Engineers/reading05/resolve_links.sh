#!/bin/sh

for file in $(ls $@)
do
	if [ -h  "$@/$file" ]; then
		echo "$@/$file to $(readlink "$@/$file")"
	fi
done
