#!/bin/sh

url=$1

#latency data 
if [[ $2 == 1 ]] 
then
	./thor.py -v -r 10 $url"/small.dat" 2>&1 > /dev/null  | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "0 " (1000/(time[2]/time[1])) " small file";
	}
	'  > throughput.dat #small file

	./thor.py -v -r 10 $url"/medium.dat" 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "1 " (1000000/(time[2]/time[1])) " medium file";
	}
	' >> throughput.dat #medium file 

	./thor.py -v -r 5 $url"/large.dat" 2>&1 > /dev/null  | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "2 " (1000000000/(time[2]/time[1])) " large file";
	}
	'  >> throughput.dat #large file  
fi

if [[ $2 == 2 ]]
then
	./thor.py -v -r 10 $url"/small.dat" 2>&1 > /dev/null  | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "0 " (1000/(time[2]/time[1])) " small file";
	}
	'  > throughputf.dat #small file

	./thor.py -v -r 10 $url"/medium.dat" 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "1 " (1000000/(time[2]/time[1])) " medium file";
	}
	' >> throughputf.dat #medium file 

	./thor.py -v -r 5 $url"/large.dat" 2>&1 > /dev/null  | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "2 " (1000000000/(time[2]/time[1])) " large file";
	}
	'  >> throughputf.dat #large file  
fi


