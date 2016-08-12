Homework 08
===========

Activity 1: timeout.py
----------------------

1.	The role of the child process is to execute the command using an os.execvp() command. The role of the parent process is to manage the child and terminate the process if it runs longer than the specified time, primarily using a signal.alarm() command, os.wait(), and os.kill() if necessary.

2.	The timeout mechanism was implemented using the os.alarm() function to queue a signal.ALRM signal to be sent to the parent after a certain ammount of time, if the completion of the child process did not cancel the alarm. If the alarm persists, the signal would be recieved by a recieve_alarm() function that executes an os.kill() on the child process, returning a nonzero exit status.

3.	The test script uses a series of if statements to verify that each of the conditions in the Testing section of the assignment are met. The script uses a series of grep -q commands and instantiations of timeout.py to test each of the conditions, echoing an error message and exiting with an error code corresponding to the condition number if a condition is not met.

4.	The result will always be the sleep command's early termination. This is because there is a fractional delay in the time between the alarm being set and the execution of the subprocess, which means the alarm will always be triggered before sleep is completed, even if only by a marginal ammount of time. This is true no matter what time the two variables are set to, so long as they are the same. Since the program is proceeding through processes sequentially and not simultaneously, it is reasonable to assume that this result will remain consistent.

Activity 2: rorshach.py
-----------------------

1.	For each directory in the arguments list, each result of os.listdir( directory ) was validated as a file and its full path added to the files dictionary along with its modification time. 

2.	The rules were loaded from the .yaml file using the yaml.load() function as a series of dictionaries containing the pattern and corresponding action. If a file was either new or changed, then re.match() would be called on each pattern in the list of dictionaries to search for a possible match. If a match was found, that pattern's action and the matching filepath would be passed to the do_action() function to implement the action.

3.	Dictionaries were the primary data structure used in this script because of their simple keyed access process. Checking if a file had been changed or was new consisted of a two-part if-statement that checked each file in the current dictionary against a dictionary of files retained from the previous loop iteration. If a file didn't appear in old_files, then it was newly created and if the modification times were different between the two for the same filepath, then the file had been changed.

4.	If an action was called for, the action and the corresponding filepath were passed to the do_action() function, which formatted the function call appropriately for filename vs. filepath and appropriately split the command into shell syntax, finally using sub.call to handle the process itself.

5.	1.	In the context of rorshach.py, busy waiting is the continuous execution of the while(True) loop that keeps the program running. This loop runs whether or not anything has changed in the directories, consuming unnecissary processing time/power. This could be mitigated by developing an external detect_changes() algorithm and having the regex validation and external actions only checked if a change occurs.

	2.	In this context, the cache invalidation problemis the overwriting of the old_files dictionary and creation of an entirely new files dictionary, even if no changes were made on the previous iteration. This can lead to latency issues, especially as the size/number of directories is increased. These problems could be mitigated by only overwriting old_files when a change has been detected and by comparing data to old_files as it is obtained instead of storing it and comparing it seperately.