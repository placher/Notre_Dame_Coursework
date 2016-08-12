def usage():
	
	"""Prints usage information for dd.py utility."""
	
	print "Usage: dd.py options..."
	print ""
	print "Options:"
	print ""
	print "	if=FILE     Read from FILE instead of stdin"
	print "	of=FILE     Write to FILE instead of stdout"
	print ""
	print "	count=N     Copy only N input blocks"
	print "	bs=BYTES    Read and write up to BYTES bytes at a time"
	print ""
	print "	seek=N      Skip N obs-sized blocks at start of output"
	print "	skip=N      Skip N ibs-sized blocks at start of input"

#import packages
import sys, os

#default options
ifile = 0
ofile = 1
count = sys.maxint
bytes = 512
seek = 0
skip = 0

#parse command line options
for arg in sys.argv[1:]:
	if "-h" in arg:
		usage()
		sys.exit(2)
	elif "if=" in arg:
		tvar = arg.split("=")
		ifile = os.open(tvar[1],os.O_RDONLY)
	elif "of=" in arg:
		tvar = arg.split("=")
		ofile = os.open(tvar[1], os.O_RDWR | os.O_CREAT)
	elif "count=" in arg:
		tvar = arg.split("=")
		count = int(tvar[1])
	elif "bs=" in arg:
		tvar = arg.split("=")
		bytes = int(tvar[1])
	elif "seek=" in arg:
		tvar = arg.split("=")
		seek = int(tvar[1])
	elif "skip=" in arg:
		tvar = arg.split("=")
		skip = int(tvar[1])

#seek/skip if possible
if ifile != 0:
	os.lseek(ifile,skip,0)
if ofile != 1:
	os.lseek(ofile,seek,0)

#loop over copy
tvar = os.read(ifile,bytes)
counting = 1
while tvar != "" and counting <= count:
	if ofile == 1:
		print tvar
	else:
		os.write(ofile,tvar)
	tvar = os.read(ifile,bytes)
	counting += 1

os.close(ifile)
os.close(ofile)