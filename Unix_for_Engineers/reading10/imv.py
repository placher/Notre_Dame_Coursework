#import packages
import os, sys, subprocess

if sys.argv[1] == "-h":
	print "Usage: imv.py FILES..."
	sys.exit(0)
else:	
	#create temporary file
	tfile = os.open("temporaryimvfile.txt", os.O_RDWR | os.O_CREAT)
	
	#gather requisite files
	for arg in sys.argv[1:]:
		if "*" in arg:
			tvar = arg.split("*")
			for file in os.listdir("."):
				if tvar[1] in file and file is not "temporaryimvfile.txt":
					os.write(tfile,file)
					os.write(tfile,os.linesep)
		else:
			os.write(tfile,arg)
			os.write(tfile,os.linesep)
	os.close(tfile)
	
	#open editor
	os.system("nano temporaryimvfile.txt")
	
	#wait until editor closes
	pid = subprocess.check_output(["pidof","nano"])
	temp = os.waitpid(pid[:-1],os.WNOHANG)
	
	#rename files with new paths from temporary file
	names = [name.rstrip('\n') for line in open("temporaryimvfile.txt")]
	count = 0
	for arg in sys.argv[1:]:
		if "*" in arg:
			tvar = arg.split("*")
			for file in os.listdir("."):
				if tvar[1] in file:
					try: os.rename(file, names[count])
					except OSError:
						print "Unable to rename", file, "to", names[count]
						print "Exiting..."
						sys.exit(0)
					count += 1
		else:
			try: os.rename(arg, names[count])
			except OSError:
				print "Unable to rename", file, "to", names[count]
				print "Exiting..."
				sys.exit(0)
			count += 1
	
	#remove temporary file
	os.system("rm temporaryimvfile.txt")