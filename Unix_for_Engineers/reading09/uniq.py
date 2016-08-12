import sys
if sys.argv[1] == "-h":
	print "usage: uniq.py [-c] files ..."
	print ""
	print "	-c		prefix lines by the number of occurence"
else:
	count = {}
	for arg in sys.argv[1:]:
		if arg != "-c":
			if "." in arg:
				file = open(arg,'r')
				for line in file:
					for word in line.split():
						if word in count:
							count[word] += 1
						else:
							count[word] = 1
			else:
				if arg in count:
					count[arg] += 1
				else:
					count[arg] = 1
	if sys.argv[1] == "-c":
		for key in count:
			print count[key], key
	else:
		for key in count:
			print key