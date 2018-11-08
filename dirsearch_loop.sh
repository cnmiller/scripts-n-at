#!/bin/bash
# A simple script to make Diresearch loop over a file containing URLs. For example, handy to use with GnmapParser's PeepingTom.txt.
# Usage ./dirsearch_loop.sh [File Path]

while read p; do
	./dirsearch.py -u $p -e / #More options can be added here such as wordlists (-w), response code excludes (-x), etc.
done <"$1"
