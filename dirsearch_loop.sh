#!/bin/bash

while read p; do
	./dirsearch.py -u $p -e /
done <"$1"
