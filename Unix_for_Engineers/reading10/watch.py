#import packages
import os, sys
from time import sleep

#parse command line arguments
if sys.argv[1] == "-n":
	timer = int(sys.argv[2])
	command = " ".join(sys.argv[3:])
else:
	command = " ".join(sys.argv[1:])
	timer = 2

#loop until keyboard interrupt
while True:
	try:
		os.system("clear")
		print "Every ", timer, "s: ", command
		os.system(command)
		sleep(timer)
	except KeyboardInterrupt:
		sys.exit(0)