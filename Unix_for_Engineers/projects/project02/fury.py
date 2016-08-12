#!/usr/bin/env python2.7

import work_queue
import string
import itertools
import os
import sys
import json

#alphabet constant
ALPHABET = string.ascii_lowercase + string.digits

if os.path.exists('journal.json'): JOURNAL = json.load(open('journal.json'))
else: JOURNAL = {}

queue = work_queue.WorkQueue(work_queue.WORK_QUEUE_DEFAULT_PORT, name='hulk-jlacher1', catalog=True)
queue.specify_log('fury.log')

#passwords of length 1
command = './hulk.py -l 1'
if command not in JOURNAL:
	task = work_queue.Task(command)
	for source in ('hulk.py','hashes.txt'):
		task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
	queue.submit(task)
else: print >>sys.stderr, 'Already ran', command

#passwords of length 2
command = './hulk.py -l 2'
if command not in JOURNAL:
	task = work_queue.Task(command)
	for source in ('hulk.py','hashes.txt'):
		task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
	queue.submit(task)
else: print >>sys.stderr, 'Already ran', command

#passwords of length 3
command = './hulk.py -l 3'
if command not in JOURNAL:
	task = work_queue.Task(command)
	for source in ('hulk.py','hashes.txt'):
		task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
	queue.submit(task)
else: print >>sys.stderr, 'Already ran', command

#passwords of length 4
command = './hulk.py -l 4'
if command not in JOURNAL:
	task = work_queue.Task(command)
	for source in ('hulk.py','hashes.txt'):
		task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
	queue.submit(task)
else: print >>sys.stderr, 'Already ran', command

#passwords of length 5
command = './hulk.py -l 5'
if command not in JOURNAL:
	task = work_queue.Task(command)
	for source in ('hulk.py','hashes.txt'):
		task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
	queue.submit(task)
else: print >>sys.stderr, 'Already ran', command

#passwords of length 6
for prefix in itertools.product(ALPHABET, repeat=1):
	command = './hulk.py -l 6 -p {}'.format(''.join(prefix))
	if command not in JOURNAL:
		task = work_queue.Task(command)
		for source in ('hulk.py','hashes.txt'):
			task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
		queue.submit(task)
	else: print >>sys.stderr, 'Already ran', command

#passwords of length 7
for prefix in itertools.product(ALPHABET, repeat=2):
	command = './hulk.py -l 7 -p {}'.format(''.join(prefix))
	if command not in JOURNAL:
		task = work_queue.Task(command)
		for source in ('hulk.py','hashes.txt'):
			task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
		queue.submit(task)
	else: print >>sys.stderr, 'Already ran', command
	
#passwords of length 8
for prefix in itertools.product(ALPHABET, repeat=3):
	command = './hulk.py -l 8 -p {}'.format(''.join(prefix))
	if command not in JOURNAL:
		task = work_queue.Task(command)
		for source in ('hulk.py','hashes.txt'):
			task.specify_file(source, source, work_queue.WORK_QUEUE_INPUT)
		queue.submit(task)
	else: print >>sys.stderr, 'Already ran', command

#wait until the master queue is empty
while not queue.empty():
	task = queue.wait()
	if task and task.return_status == 0:
		JOURNAL[task.command] = task.output.split()
		with open('journal.json.new', 'w') as stream:
			json.dump(JOURNAL, stream)
		os.rename('journal.json.new', 'journal.json')