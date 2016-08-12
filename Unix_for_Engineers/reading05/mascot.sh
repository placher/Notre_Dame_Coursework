#!/bin/sh

os= uname
if [ "$os" = "Linux" ]; then
	echo "Tux"
elif [ "$os" = "Darwin" ]; then
	echo "Hexley"
elif [ "$os" = "FreeBSD" ]; then
	echo "Beastie"
elif [ "$os" = "NetBSD" ]; then
	echo "Beastie"
elif [ "$os" = "OpenBSD" ]; then
	echo "Beastie"
fi
