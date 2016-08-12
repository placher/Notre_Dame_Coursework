#!/usr/bin/env python2.7

import os
import socket
import sys

# constants

address = '127.0.0.1'
port = 9234
program = os.path.basename(sys.argv[0])

# create socket
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(( address, port ))

stream = client.makefile('w+')

'''

#using stdin
data   = sys.stdin.readline()

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

# pinging for http
# send http request to server
self.stream.write('GET / HTTP/1.0\r\n')
self.stream.write('Host: {}\r\n'.format( address ))
self.stream.write('\r\n')
self.stream.flush()

# get response
data = stream.readline()
while data:
	sys.stdout.write( data )
	data = stream.readline()