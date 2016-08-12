all: is_palindrome

is_palindrome: is_palindrome.c
	gcc is_palindrome.c -g -gdwarf-2 -o is_palindrome
	
clean:
	rm is_palindrome is_palindrome.completed

test: is_palindrome is_palindrome.input is_palindrome.output
	is_palindrome < is_palindrome.input > is_palindrome.complete
	diff -q -s is_palindrome.output is_palindrome.complete