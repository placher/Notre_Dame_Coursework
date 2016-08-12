#!/usr/bin/env python2.7

import getopt
import logging
import os
import socket
import sys
import mimetypes
import signal
import os.path as path

# Constants

ADDRESS  = '0.0.0.0'
PORT	 = 9231
BACKLOG  = 0
DOCROOT  = '/'
FORK 	 = False
LOGLEVEL = logging.INFO
PROGRAM  = os.path.basename(sys.argv[0])

# Utility Functions

def usage(status=0):
	print >> sys.stderr, '''Usage: spidey.py [-d DOCROOT -p PORT -f -v]

Options:
	-h		Show this help message
	-f		Enable forking mode
	-v		Set logging to DEBUG level

	-d DOCROOT	Set root directory (default is current directory)
	-p PORT		TCP Port to listen to (default is 9234)'''
	sys.exit(status)

# BaseHandler Class

class BaseHandler(object):

	def __init__(self, fd, address):
		''' Construct handler from file descriptor and remote client address '''
		self.logger  = logging.getLogger()        # Grab logging instance
		self.socket  = fd                         # Store socket file descriptor
		self.address = '{}:{}'.format(*address)   # Store address
		self.stream  = self.socket.makefile('w+') # Open file object from file descriptor

		self.debug('Connect')

	def debug(self, message, *args):
		''' Convenience debugging function '''
		message = message.format(*args)
		self.logger.debug('{} | {}'.format(self.address, message))

	def info(self, message, *args):
		''' Convenience information function '''
		message = message.format(*args)
		self.logger.info('{} | {}'.format(self.address, message))

	def warn(self, message, *args):
		''' Convenience warning function '''
		message = message.format(*args)
		self.logger.warn('{} | {}'.format(self.address, message))

	def error(self, message, *args):
		''' Convenience error function '''
		message = message.format(*args)
		self.logger.error('{} | {}'.format(self.address, message))

	def exception(self, message, *args):
		''' Convenience exception function '''
		message = message.format(*args)
		self.logger.error('{} | {}'.format(self.address, message))

	def handle(self):
		''' Handle connection '''
		self.debug('Handle')
		raise NotImplementedError

	def finish(self):
		''' Finish connection by flushing stream, shutting down socket, and then closing it '''
		self.debug('Finish')
		try:
			self.stream.flush()
			self.socket.shutdown(socket.SHUT_RDWR)
		except socket.error as e:
			pass    # Ignore socket errors
		finally:
			self.socket.close()

# HTTPHandler Class

class HTTPHandler(BaseHandler):
	def __init__(self,fd,address,docroot="."):
		BaseHandler.__init__(self,fd,address)
		self.docroot = docroot
	
	def handle(self):
		''' Handle connection '''
		#get request
		self._parse_request()
		
		# Build uripath by normalizing REQUEST_URI
		self.uripath = os.path.normpath(self.docroot + os.environ['REQUEST_URI'])
		
		# Check path existence and types and then dispatch
		if not os.path.exists(self.uripath):
			self._handle_error(404)
		elif os.path.isfile(self.uripath) and os.access(self.uripath,os.X_OK):
			self._handle_script()
		elif os.path.isfile(self.uripath) and os.access(self.uripath,os.R_OK):
			self._handle_file()
		elif os.path.isdir(self.uripath) and os.access(self.uripath,os.R_OK):
			self._handle_directory()
		else:
			self._handle_error(403)
		
	def _parse_request(self):
		#print self.address
		request = self.stream.readline()
		#print request
		request.split()
		#print request.split()[1].split('?')[0], "ZER)"
		os.environ['REQUEST_METHOD'] = request.split()[0]
		os.environ['REQUEST_URI'] = request.split()[1].split('?')[0]
		try:
			os.environ['QUERY_STRING'] = request.split()[1].split('?')[1]
		except:
			pass

		request = self.stream.readline()
		while request:
			
			#print request
			Var = "HTTP_" + request.split(':')[0].upper().replace('-','_')
			
			if len(request.split()) < 2:
				
				#print request
				break
			#print request.split()[1], '=', Var
			os.environ[Var] = request.split()[1]
			request = self.stream.readline()
		#print "worked"

		
		os.environ['REMOTE_ADDR'] = self.address.split(':', 1)[0]
		os.environ['REMOTE_HOST'] = self.address.split(':', 1)[0]
		os.environ['REMOTE_PORT'] = self.address.split(':', 1)[1]
	
	def _handle_file(self):
		mimetype, _ = mimetypes.guess_type(self.uripath)
		if mimetype is None:
			mimetype = 'application/octet-stream'		
		
		#send the response to the socket 
		self.stream.write('HTTP/1.0 200 OK\r\n')
		self.stream.write('Content-Type: {}\r\n'.format(mimetype))
		self.stream.write('\r\n')
		
		#read the file in binary mode
		targetfile = open(self.uripath, 'r+b')
		#write the contents of a file to a socket
		for line in targetfile:
			self.stream.write(line)
		self.stream.flush()
	
	def _handle_directory(self):
		#send response to the socket
		self.stream.write('HTTP/1.0 200 OK\r\n')
		self.stream.write('Content-Type: text/html\r\n')
		self.stream.write('\r\n')
		self.stream.write('<head><title>{}</title><link href="https://www3.nd.edu/~pbui/static/css/blugold.css" rel="stylesheet"></head>\r\n'.format(os.environ['REQUEST_URI']))
		self.stream.write('<table class="table table-stripped">\r\n')
		self.stream.write('<thead><th>Type</th><th>Size</th><th>Name</th></thead><tbody>\r\n')
		#print contents of directory
		t_array = os.listdir(self.uripath)
		for file in t_array:
			
			t_path = '/'.join(['.',self.uripath,file])
			if path.isdir(t_path):
				t_type = 'directory'
				t_size = ' - '
			elif path.isfile(t_path):
				t_type = 'file'
				t_size = path.getsize(t_path)
			else:
				t_type = ' - '
				t_size = ' - '
			t_link = path.join(os.environ['REQUEST_URI'],file)
			self.stream.write('<tr><td>{}</td><td>{}</td><td><a href="{}">{}</a></td></tr><tr></tr>\r\n'.format(t_type,t_size,t_link,file))
		self.stream.write('</tbody></table>\r\n')
		self.stream.flush()
	
	def _handle_script(self):
		signal.signal(signal.SIGCHLD,signal.SIG_DFL)
		t_script = os.popen(self.uripath)
		for line in t_script:
			self.stream.write(line)
		self.stream.flush()
		t_script.close()
		signal.signal(signal.SIGCHLD,signal.SIG_IGN)
	
	def _handle_error(self, errorcode):
		#send response to the socket
		self.stream.write('HTTP/1.0 200 OK\r\n')
		self.stream.write('Content-Type: text/html\r\n')
		self.stream.write('\r\n')
		self.stream.write('<head><title>ERROR 404</title><link href="https://www3.nd.edu/~pbui/static/css/blugold.css" rel="stylesheet"></head>\r\n')
		#report error
		self.stream.write('<h1>Error {}</h1>\r\n'.format(errorcode))
		self.stream.write('<p></p>\r\n')
		self.stream.write('<p></p>\r\n')
		self.stream.write('<img src="https://40.media.tumblr.com/436591f740ea6d8cb4a1f2858ee00f1d/tumblr_o34tqjXTky1tsy4y2o1_500.jpg" alt="Error 697: Meme Too Dank">')
		self.stream.flush()

# TCPServer Class

class TCPServer(object):
	def __init__(self,address,port,handler,forking):
		self.logger = logging.getLogger()
		self.address = socket.gethostbyname(address)
		self.port = port
		self.socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
		self.handler = handler
		self.forking = forking

	def run(self):
		try:
			self.socket.bind((self.address,self.port))
			self.socket.listen(BACKLOG)
		except socket.error as e:
			self.logger.error('Could not listen on {}:{}: {}'.format(self.address, self.port, e))
			sys.exit(1)
		self.logger.info('Listening on {}:{}...'.format(self.address,self.port))
	
		signal.signal(signal.SIGCHLD,signal.SIG_IGN)
		
		while True:
			client,address = self.socket.accept()
			self.logger.debug('Accepted connection from {}:{}'.format(*address))

			if not self.forking:
				try:
					handler = self.handler(client,address)
					handler.handle()
				except Exception as e:
					handler.exception('Exception: {}', e)
				finally:
					handler.finish()
			else:
				try:
					pid = os.fork()
				except OSError as e:
					print >> sys.stderr, 'Forking error: {}'.format(e)
				if pid == 0:
					try:
						handler = self.handler(client,address)
						handler.handle()
					except Exception as e:
						handler.exception('Exception: {}',e)
					finally:
						handler.finish()
					os._exit(0)
				else:
					client.close()

# Main Execution

if __name__ == '__main__':
	
	try:
		options, arguments = getopt.getopt(sys.argv[1:],"hd:p:fv")
	except getopt.GetoptError as e:
		usage(1)

	for option, value in options:
		if option == '-v':
			LOGLEVEL = logging.DEBUG
		if option == '-d':
			DOCROOT = value
		if option == '-p':
			PORT = int(value)
		if option == '-f':
			FORK = True
		if option == '-h':
			usage(0)

	logging.basicConfig(
		level	= LOGLEVEL,
		format	= '[%(asctime)s] %(message)s',
		datefmt	= '%d-%m-%Y %H:%M:%S'
	)
		
	server = TCPServer(ADDRESS, PORT, HTTPHandler, FORK)
	try:
		server.run()
	except KeyboardInterrupt:
		sys.exit(0)
