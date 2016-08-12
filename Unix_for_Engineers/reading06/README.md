Reading 06
==========

1.

	$ echo "All your base are belong to us" | tr 'a-z' 'A-Z'
	
2.

	$ grep root /etc/passwd
	
3.

	$ echo "monkeys love bananas" | sed 's/monkeys/gorillaz/g'
	
4.

	$ cat /etc/passwd | sed 's#bin/bash#usr/bin/python#g;s#bin/csh#usr/bin/python#g;s#bin/tcsh#usr/bin/python#g' | grep python
	
5.

	$ echo "       monkeys love bananas" | sed 's/^[\ ]*//'
	
6.

	$ cat /etc/passwd | grep '4[0-9]7\|47'
	
7.

	$ tail -f access.log
	
8.

	$ comm -12 file1 file2