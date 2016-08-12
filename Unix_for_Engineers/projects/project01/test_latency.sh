#!/bin/sh

url=$1

#latency data 
if [[ $2 == 1 ]]
then
	./thor.py -v -r 100 $url 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "0 " time[2]/time[1] "	directory";
	}
	'  > latency.dat #basic url average 
	
	./thor.py -v -r 100 $url"/hello.html" 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "1 " time[2]/time[1] " file";
	}
	' >> latency.dat #basic url with hello.html

	./thor.py -v -r 100 $url"/cgi-bin/env.sh" 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "2 " time[2]/time[1] " script";
	}
	'  >> latency.dat #url with shell script  
fi


if [[ $2 == 2 ]]
then
	./thor.py -v -r 100 $url 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "0 " time[2]/time[1] "	directory";
	}
	'  > latencyf.dat #basic url average 
	
	./thor.py -v -r 100 $url"/hello.html" 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "1 " time[2]/time[1] " file";
	}
	' >> latencyf.dat #basic url with hello.html

	./thor.py -v -r 100 $url"/cgi-bin/env.sh" 2>&1 > /dev/null | grep Average | awk -F ' ' '{ time[1]++; time[2]+=$8 } END {
	print "2 " time[2]/time[1] " script";
	}
	'  >> latencyf.dat #url with shell script  
fi
