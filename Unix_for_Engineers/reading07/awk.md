TLDR - awk
==========

Overview
--------

[awk] is an interpreted programming language designed for text processing and typically used as a data extraction and reporting tool. It is a standard feature of most Unix-like operating systems.

Examples
--------

- Print specific fields

	$ awk '/Field/'
	
- Modifying field seperators

	$ awk 'BEGIN { FS = "," }; {action} '
	
- Uses of BEGIN and END in awk

	- BEGIN is used for preprocessor functions like initializing variables and printing headings
	- END is used to print results of operations and other info after awk code
	
- Pattern matching

	- Awk accepts patterns in the same format as other regex systems
	$ '/^pattern$/'
	
- Using special variables

	- NF stores the current number of fields in the current input record
	- NR stores the number of input records awk has processed since the begining of the program's execution
	- These variables, and others, can be referenced in-line in awk commands, and are updated every time a new record is read into awk
	
- Associative arrays in awk

	$ arrayname[index_string]=value
	$ delete arrayname[index_string]

Resources
---------

- [Linux.net Awk](http://linux.die.net/man/1/awk)

- [GNU Awk](http://www.gnu.org/software/gawk/manual/gawk.html)

- [Wikipedia](https://en.wikipedia.org/wiki/AWK)