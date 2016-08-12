#!/usr/bin/env python2.7

import string
import sys
import random
import itertools
import hashlib
from optparse import OptionParser

# Constants
ALPHABET = string.ascii_lowercase + string.digits
#LENGTH = int(sys.argv[1])
#ATTEMPTS = int(sys.argv[2])
#HASHES = sys.argv[2]

# Utility Function

def md5sum(s):
	return hashlib.md5(s).hexdigest()
	
# Main Execution

if __name__=='__main__':
	
	#parse command line options
	parser = OptionParser(usage="usage: %prog [-a ALPHABET -l LENGTH -s HASHES -p PREFIX]")
	parser.add_option("-a", dest="alphabet", type="string", default=ALPHABET, help="Alphabet used for passwords", metavar="RULES")
	parser.add_option("-l", dest="length", default=8, type="int", help="Length for passwords", metavar="LENGTH")
	parser.add_option("-s", dest="hashes", type="string", default="hashes.txt", help="Path to file containing hashes", metavar="HASHES")
	parser.add_option("-p", dest="prefix", type="string", default='', help="Prefix to use for each candidate password", metavar="PREFIX")

	(options, args) = parser.parse_args();
	
	hashes = set([l.strip() for l in open(options.hashes)])
	
	'''
	found = set()
	for attempt in range(ATTEMPTS):
		candidate = ''.join([random.choice(ALPHABET) for _ in range(LENGTH)])
		checksum = md5sum(candidate)
		if checksum in hashes:
			found.add(candidate)
	
	for word in sorted(found):
		print word
	'''	
	for candidate in itertools.product(options.alphabet, repeat=(options.length-len(options.prefix))):
		attempt = ''.join([options.prefix, ''.join(candidate)])
		checksum = md5sum(attempt)
		if checksum in hashes:
			print attempt