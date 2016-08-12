import sys
if sys.argv[1] == "-h":
	print "usage: wc.py [-c -l -w] files ..."
	print ""
	print "	-c		print the byte/character counts"
	print "	-l		print the newline counts"
	print "	-w		print the word counts"
else:
	if sys.argv[1] not in ["-c", "-l", "-w"]:
		print "Error: No Flags Passed"
		sys.exit
	else:
		linecount = 0
		wordcount = 0
		charcount = 0
		if "." in sys.argv[-1]:
			for arg in sys.argv[1:]:
				if arg not in ["-c", "-l", "-w"]:
					file = open(arg,'r')
					for line in file:
						linecount += 1
						for word in line.split():
							wordcount += 1
							charcount += len(word)
		else:
			for arg in sys.argv[1:]:
				if arg not in ["-c", "-l", "-w"]:
					wordcount += 1
					charcount += len(arg)
		if "-l" in sys.argv:
			print "Line Count= ",linecount
		if "-w" in sys.argv:
			print "Word Count= ",wordcount
		if "-c" in sys.argv:
			print "Character Count= ",charcount