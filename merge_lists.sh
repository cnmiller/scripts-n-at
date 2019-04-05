#!/bin/bash

# This script can used to create all possible combintations of lines from two
# lists. Usage: ./merge_lists.sh $file1 $file2

while read a; do 
	while read b; do 
		echo "$b $a"; 
	done < $1; # First File
done < $2 # Second File
