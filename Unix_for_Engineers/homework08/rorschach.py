#!/usr/bin/env python2.7

import sys,os,time,yaml,re,shlex
from optparse import OptionParser
import os.path as path
import subprocess as sub

def debugging( message, *arguments ):
	if options.verbose:
		print >>sys.stderr, message.format( *arguments )
		
def do_action( action, file ):
	go = action.format( name=path.basename(file), path=file )
	
	#split arguments to be callable in shell
	go = shlex.split( go )
	sub.call( go )

#parse command line options
parser = OptionParser(usage="usage: %prog [-r RULES -t SECONDS] DIRECTORIES")
parser.add_option("-r", dest="rule", type="string", default=".rorschach.yml", help="Path to rules file ( default is .rorschach.yml )", metavar="RULES")
parser.add_option("-t", dest="seconds", default=2, type="int", help="Time between scans ( default is 2 seconds )", metavar="SECONDS")
parser.add_option("-v", action="store_true", dest="verbose", default=False, help="Display verbose debugging output")

(options, args) = parser.parse_args();

#enforce default directory (current) if no directory argument is given
if ( args == [] ): args = ['.']

#read rules from .yaml file
debugging( "Reading rules from: {}", options.rule )
rules = yaml.load( file( options.rule, 'r') ) #read as a list of dicts like {'action': 'echo {path}','pattern': '*'}

#compile rules regexes to comparable objects
debugging( "Compiling rule regular expressions" )
for dict in rules:
	pattern = dict[ 'pattern' ]
	dict[ 'pattern' ] = re.compile( pattern )

#build a dictionary of files in the directories
debugging( "Building initial dictionary of files" )
files = {}
for dir in args:
	for file in os.listdir(dir):
		if os.path.isfile(path.join(dir,file)):
			files[path.join(dir,file)] = time.ctime(path.getmtime(path.join(dir,file)))

#create loop that will continue program untill killed by keyboard interrupt
try:
	while ( True ):
		
		#wait specified time
		time.sleep( options.seconds )
		
		#reindex current file data as old file data
		old_files = files
		
		#get new status of files
		debugging( "Getting current status of files..." )
		files = {}
		for dir in args:
			for file in os.listdir(dir):
				if os.path.isfile(path.join(dir,file)):
					files[path.join(dir,file)] = time.ctime(path.getmtime(path.join(dir,file)))
					
		#find files that have been created or changed
		debugging( "Checking for changes in files..." )
		for file in files:
			if ( file not in old_files ) or ( files[file] != old_files[file] ): #file has been created or changed since last test
				debugging( "Found change in: {}", file )
				for dict in rules:
					if re.match( dict[ 'pattern' ], path.basename(file) ): #file matches a regex in rules
						debugging( "{} matched regex {}", path.basename(file), dict[ 'pattern' ] )
						do_action( dict[ 'action' ], file ) #execute the action called for by the rule

except KeyboardInterrupt as e:
	debugging("KeyboardInterrupt recieved, shutting down")
	sys.exit( 0 )