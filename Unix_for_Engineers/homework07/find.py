def usage():
	
	"""Print usage information for the find.py utility."""
	
	print "Usage: find.py directory [options]..."
	print ""
	print "Options:"
	print ""
	print "	-type [f|d]     File is of type f for regular file or d for directory"
	print ""
	print "	-executable     File is executable and directories are searchable to user"
	print "	-readable       File readable to user"
	print "	-writable       File is writable to user"
	print ""
	print "	-empty          File or directory is empty"
	print ""
	print "	-name  pattern  Base of file name matches shell pattern"
	print "	-path  pattern  Path of file matches shell pattern"
	print "	-regex pattern  Path of file matches regular expression"
	print ""
	print "	-perm  mode     File's permission bits are exactly mode (octal)"
	print "	-newer file     File was modified more recently than file"
	print ""
	print "	-uid   n        File's numeric user ID is n"
	print "	-gid   n        File's numeric group ID is n"
	
def include(p):
	
	"""Determine if a file/directory should be printed."""
	
	#file type discrimination
	if type == 'f':
		if not os.path.isfile(p): return False
	elif type == 'd':
		if not os.path.isdir(p): return False
	
	#permission discrimination
	if readable == 1:
		if os.access(p,os.R_OK) is False: return False
	if writable == 1:
		if os.access(p,os.W_OK) is False: return False
	if executable == 1:
		if os.access(p,os.X_OK) is False: return False
	
	#empty discrimination
	if empty == 1:
		if not os.listdir(p) == [] : return False
	
	#regex discrimination
	if not name == "x":
		if fnmatch.fnmatch(os.path.basename(p), name) is False: return False
	if not path == "x":
		if fnmatch.fnmatch(os.path.dirname(p), path) is False: return False
	if not regex == "x":
		if not re.search(regex,os.path.dirname(p), regex): return False
		
	#inode discrimination
	try: fInode = os.stat(p)
	except:
		fInode = os.lstat(p)
		print "Error in retrieving data for: ", p
	if not perm == "x":
		if not fInode.st_mode == perm: return False
	if not newer == "x":
		tInode = os.stat(newer)
		if not fInode.st_mtime >= tInode.st_mtime: return False
	if not uid == 0:
		if not uid == fInode.st_uid: return False
	if not gid == 0:
		if not gid == fInode.st_gid: return False
		
	#default return
	return True
	
#import packages
import sys, os, fnmatch, re
from os.path import join

#navigation markers for parsing options
ftype = 0
fname = 0
fpath = 0
fregex = 0
fperm = 0
fnewer = 0
fuid = 0
fgid = 0

#command line data
directory="./"
type = "x"
executable = 0
readable = 0
writable = 0
empty = 0
name = "x"
path = "x"
regex = "x"
perm = "x"
newer = "x"
uid = 0
gid = 0

#catch help flag
if sys.argv[1] == "-h":
	usage()
	sys.exit(2)

#parse command line options
try: directory = sys.argv[1]
except: directory = "./"
for arg in sys.argv[2:]:
	if ftype == 1:
		type = arg
		ftype = 0
	elif fname == 1:
		name = arg
		fname = 0
	elif fpath == 1:
		path = arg
		fpath = 0
	elif fregex == 1:
		regex = arg
		fregex = 0
	elif fperm == 1:
		perm = arg
		fperm = 0
	elif fnewer == 1:
		newer = arg
		fnewer = 0
	elif fuid == 1:
		uid = int(arg)
		fuid = 0
	elif fgid == 1:
		gid = int(arg)
		fgid = 0
	elif "-type" in arg:
		ftype = 1
	elif "-executable" in arg:
		executable = 1
	elif "-readable" in arg:
		readable = 1
	elif "-writable" in arg:
		writable = 1
	elif "-empty" in arg:
		empty = 1
	elif "-name" in arg:
		fname = 1
	elif "-path" in arg:
		fpath = 1
	elif "-regex" in arg:
		fregex = 1
	elif "-perm" in arg:
		fperm = 1
	elif "-newer" in arg:
		fnewer = 1
	elif "-uid" in arg:
		fuid = 1
	elif "-gid" in arg:
		fgid = 1

#recursively print directories
for root, dirs, files in os.walk(directory,topdown=True,followlinks=True):
	if include(root) is True: print root
	for name in files:
		if include(join(root,name)) is True: print join(root,name)