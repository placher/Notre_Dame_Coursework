Project 02: Distributed Computing
=================================

Please see the [distributed computing project] write-up.

[distributed computing project]: https://www3.nd.edu/~pbui/teaching/cse.20189.sp16/homework10.html

###1.
hulk.py iterates through every possible password permutation for the given alphabet and length, encrypts them, and tests them against the library of hashes passed to hulk.py. If a result matches, it is printed to stdout. We first tested it against hashes.txt with length 1 and verified that we got every character. We then tested it against a test file of length 3 hashes to verify that prefixes worked correctly. 

###2.
fury.py is a workflow master that distributes smaller instances of hulk.py to condor. For every possible process/permutation of hash length/prefix fury.py creates a workflow task and adds it to the workflow queue. The tasks in the queue are distributed to the worker cpus and fury.py waits for them to return a result. The call process and results are then placed in journal.json to safeguard against crashes or aborts. If fury.py crashes or is aborted it can be rebooted from journal.json and avoid repeating any previously completed tasks by checking queue tasks against keys in the journal before assigning them to worker cpus. fury.py was tested against one local workqueue.worker and then deployed to condor for parallel completion of the tasks. 

###3.
Longer passwords would be harder to brute-force because the number of possibilties would grow at an exponential rate versus a linear rate by increasing the size of the alphabet. x^(n+1) > (x+1)^n 
