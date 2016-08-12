#!/usr/bin/env python2.7

import sys,os,signal,time
from optparse import OptionParser

def receive_alarm(signum, stack):
	debugging (options.verbose, "Alarm Triggered after {} seconds!", time )
	os.kill(pid, signal.SIGTERM)
	
def debugging(verbose, message, *arguments):
	if verbose:
		print >>sys.stderr, message.format(*arguments)

parser = OptionParser()
parser.add_option("-t", dest="seconds", default=10, type="int", help="Timeout duration before killing command (default is 10 seconds)", metavar="SECONDS")
parser.add_option("-v", action="store_true", dest="verbose", default=False, help="Display verbose debugging output")

(options, args) = parser.parse_args();

command = " ".join(args[0:])
time = options.seconds

status = 15

debugging (options.verbose, 'Executing {} for at most {} seconds...', command , time )

try:
	debugging (options.verbose, "Forking...")
	pid = os.fork()
except OSError as e:
	print >>sys.stderr, 'Unable to fork: {}'.format(e)
	sys.exit(1)
	
if pid == 0: #child
	try:
		debugging ( options.verbose, "Execing..." )
		os.execvp( args[0], args[0:] )
	except OSError as e:
		print >>sys.stderr, "Error in process execution: {}".format(e)
else: #parent
	debugging ( options.verbose, "Enabling Alarm..." )
	signal.signal(signal.SIGALRM, receive_alarm)
	signal.alarm(time)
	try:
		debugging ( options.verbose, "Waiting..." )
		pid, status = os.wait()
	except OSError as e:
		debugging ( options.verbose, "Killing PID {}", pid )
	debugging ( options.verbose, "Disabling Alarm..." )
	signal.alarm(0)
	debugging ( options.verbose, "Process {} terminated with exit status {}", pid, status )
	sys.exit( status )