import sys
if sys.argv[1] == "-h":
	print "usage: wc.py [-d DELIM -f] files ..."
	print ""
	print "	-d		DELIM  use DELIM instead of TAB for field delimiter"
	print "	-f		FIELDS select only these FIELDS"
else:
	delim = "	"
	if "-f" not in sys.argv:
		print "Error: No Field Flag Passed"
		sys.exit
	else:
		foundfield = 0
		founddelim = 0
		#find arguments
		for arg in sys.argv:
			if foundfield == 1:
				fields = arg.split(',')
				foundfield = 2
			if founddelim == 1:
				delim = arg
				founddelim = 2
			if arg == "-d":
				founddelim = 1
			if arg == "-f":
				foundfield = 1
		#execute for files
		if "." in sys.argv[-1]:
			for arg in sys.argv[1:]:
				if "." in arg:
					file = open(arg,'r')
					for line in file:
						tline = line.split(delim)
						for i in fields:
							print tline[int(i) - 1],
						print ""
		#execute for stdin
		else:
			argshift = foundfield + founddelim
			stdinarg = " ".join(sys.argv[argshift:])
			tline = stdinarg.split(delim)
			for i in fields:
				print tline[int(i) - 1],
			print ""