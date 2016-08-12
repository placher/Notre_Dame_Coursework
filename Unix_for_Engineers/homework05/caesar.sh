#!/bin/sh

SHIFT=10

if [ $# -eq 1 ]; then
	SHIFT=$1
fi

SHIFT=` expr $SHIFT % 26`

ALPHABET="abcdefghijklmnopqrstuvwxyz"
UALPHABET="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
TALPHA=`echo $ALPHABET | cut -c-$SHIFT`
UTALPHA=`echo $UALPHABET | cut -c-$SHIFT`
TALPHA="$ALPHABET$TALPHA"
UTALPHA="$UALPHABET$UTALPHA"
NEWSHIFT=`expr $SHIFT + 1`
SEQUENCE=`echo $TALPHA | cut -c$NEWSHIFT-`
USEQUENCE=`echo $UTALPHA | cut -c$NEWSHIFT-`

tr "${ALPHABET:0:26}" "${SEQUENCE:0:26}" | tr "${UALPHABET:0:26}" "${USEQUENCE:0:26}"