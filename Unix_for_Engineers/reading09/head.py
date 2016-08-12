import sys
if sys.argv[1] == "-h":
	print "usage: head.py [-n NUM] files ..."
	print ""
	print "	-n [NUM]	print the first NUM lines instead of the first 10"
else:
	lines = 10
	if sys.argv[1] == "-n":
		lines = int(sys.argv[2])
		if "." in sys.argv[3]:
			for arg in sys.argv[3:]:
				printedlines = 0
				file = open(arg,'r')
				for line in file:
					print line
					printedlines += 1
					if lines == printedlines:
						break
		else:
			lines += 3
			for num in range(3,lines):
				print sys.argv[num]
	else:
		if "." in sys.argv[1]:
			for arg in sys.argv[1:]:
				printedlines = 0
				file = open(arg,'r')
				for line in file:
					print line
					printedlines += 1
					if lines == printedlines:
						break
		else:
			lines += 1
			for num in range(1,lines):
				print sys.argv[num]