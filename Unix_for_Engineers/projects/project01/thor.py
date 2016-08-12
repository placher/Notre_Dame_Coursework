#!/usr/bin/env python2.7

import time,socket,os,sys,logging,getopt

ADDRESS = 'example.com'
PORT = 80
PATH = '/'
REQUESTS = 1
PROCESSES = 1
LOGLEVEL = logging.INFO
TOTALTIME = 0

def usage(status=0):
	print >> sys.stderr, '''Usage: thor.py [-r REQUESTS -p PROCESSES -v] URL

Options:
	-h		Show this help message
	-v		Set logging to DEBUG level

	-r REQUESTS	Number of requests per process (default is 1)
	-p PROCESSES	Number of processes (default is 1)'''
	sys.exit(status)


class TCPClient(object):
	def __init__(self, address, port):
		self.logger = logging.getLogger()
		self.address = socket.gethostbyname(address)
		self.port = port
		self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

	def handle(self):
		self.logger.debug('Handle')
		raise NotImplementedError
	
	def run(self):
		try:
			self.socket.connect((self.address,self.port))
			self.stream = self.socket.makefile('w+')
		except socket.error as e:
			self.logger.error('Could not connect to {}:{}: {}'.format(self.address, self.port, e))
			sys.exit(1)

		self.logger.debug('Connected to {}:{}...'.format(self.address, self.port))
		self.logger.debug('Handle')
		try:
			self.handle()
		except Exception as e:
			self.logger.exception('Exception: {}',e)
		finally:
			self.finish()
		
	
	def finish(self):
		self.logger.debug('Finish')
		try:
			self.socket.shutdown(socket.SHUT_RDWR)
		except socket.error:
			pass
		finally:
			self.socket.close()

class HTTPClient(TCPClient):
	def __init__(self, address, port, path):
		TCPClient.__init__(self, address, port)
		self.host = address
		self.path = path
		self.logger.debug('HOST: {}'.format(self.host))
		self.logger.debug('PORT: {}'.format(self.port))
		self.logger.debug('PATH: {}'.format(self.path))

	def handle(self):
		self.logger.debug('Sending request...')
		self.stream.write('GET {} HTTP/1.0\r\n'.format(self.path))
		self.stream.write('Host: {}\r\n'.format(self.host))
		self.stream.write('\r\n')
		self.stream.flush()
		self.logger.debug('Recieving response...')
		data = self.stream.readline()
		while data:
			sys.stdout.write(data)
			data = self.stream.readline()

if __name__ == '__main__':
	
	try:
		options, arguments = getopt.getopt(sys.argv[1:], "hr:p:v")
	except getopt.GetoptError as e:
		usage(1)

	for option, value in options:
		if option == '-v':
			LOGLEVEL = logging.DEBUG
		if option == '-r':
			REQUESTS = int(value)
		if option == '-p':
			PROCESSES = int(value)
		if option == '-h':		
			usage(1)
	
	logging.basicConfig(
                level = LOGLEVEL,
                format = '[%(asctime)s] %(message)s',
                datefmt = '%d-%m-%Y %H:%M:%S'
        )

	ADDRESS = arguments[0]
	logging.debug('URL: {}'.format(ADDRESS))
	ADDRESS = arguments[0].split('://')[-1]
	if '/' in ADDRESS:
                tvar = ADDRESS.split('/')
                ADDRESS = tvar[0]
                PATH = '/'.join(['','/'.join(tvar[1:])])
	if ':' in ADDRESS:
		tvar = ADDRESS.split(':')
		ADDRESS = tvar[0]
		PORT = int(tvar[1])
	try:	
		for p in range(PROCESSES):
			try:
				pid = os.fork()
			except OSError as e:
				print >> sys.stderr, 'Forking error: {}'.format(e)
			if pid == 0:
				TOTALTIME = 0
				for r in range(REQUESTS):
					starttime = time.time()	
					client = HTTPClient(ADDRESS,PORT,PATH)
					client.run()
					endtime = time.time()
					elapsed = endtime - starttime
					TOTALTIME = TOTALTIME + elapsed
					logging.debug('{0} | Elapsed time: {1:f} seconds'.format(os.getpid(),elapsed))
				average = TOTALTIME/float(REQUESTS)
				logging.debug('{0} | Average elapsed time: {1:f} seconds'.format(os.getpid(),average))
			else:
				pass
		for p in range(PROCESSES):
			pid, status = os.wait()
			logging.debug('Process {} terminated with exit status {}'.format(os.getpid(),status))
	except KeyboardInterrupt:
		sys.exit(0)

