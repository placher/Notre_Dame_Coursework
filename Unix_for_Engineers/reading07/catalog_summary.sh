#!/bin/sh

URL="http://catalog.cse.nd.edu:9097/query.text"

if [ $# -eq 1 ]; then
	URL=$1
fi

NCPUS=$(curl -s $URL | grep 'cpus' | sed 's/^cpus //' | awk '{sum += $1 } END {print sum}')
echo "Total CPUs: $NCPUS"

NMACHINES=$(curl -s $URL | grep 'name' | uniq | wc -l)
echo "Total Machines: $NMACHINES"

MPROLIFIC=$(curl -s $URL | grep 'type' | sed 's/^type //' | awk 'max<++c[$0] {max=c[$0]} END {for(i in c)if(c[i]==max)print i}')
echo "Most Prolific Type: $MPROLIFIC"