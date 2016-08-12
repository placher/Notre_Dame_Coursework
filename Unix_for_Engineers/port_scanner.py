#!/usr/bin/env python2.7

'''
Used http://stackoverflow.com/questions/26174743/python-making-a-fast-port-scanner
for reference while trying to understand port scanners
'''

import socket
import sys

# constants
host_name = 'student00.cse.nd.edu'
low_range = 9300
high_range = 9399
default_time = 0.1

# set socket timeout
socket.setdefaulttimeout( default_time )

# get IP4 address
address = socket.gethostbyname( host_name )

# loop over all ports in range
for port in range( low_range, high_range ):
	# create socket
	candidate = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	# test if connection is available within time limit
	try:
		test = candidate.connect_ex( ( address, port ) )
	except:
		pass
	# if connection is successful
	if ( test == 0 ):
		print 'Port {} is open'.format( port )
		break
	else: candidate.close()

# get fd object for found port
stream = candidate.makefile('w+')

# read data from stream
'''
data = sys.stdin.readline()
while data:
	# send stdin to server
    stream.write(data)
    stream.flush()

    # read from server to stdout
    data = stream.readline()
    sys.stdout.write(data)

    # read from stdin
    data = sys.stdin.readline()
'''
data = stream.readline()
while data:
	sys.stdout.write(data)
	data = stream.readline()
	
# shutdown socket
candidate.shutdown(socket.SHUT_RDWR)
candidate.close()