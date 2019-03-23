#!/bin/bash

# This script can used to replace rDNS lookups in .gnmap output with the target hostname
# Usage: ./nmap-replace-hosts.sh [nmap_file.nmap] [gnmap_file.gnmap]

cat $1 | grep 'Nmap scan report for ' | cut -d' ' -f5 > nmap_tmp.tmp
cat $2 | grep '/open' | sed '/Status: Up/d' | cut -d"(" -f1 | sed 's/$/(/' > gnmap_tmp1.tmp
cat $2 | grep '/open' | sed '/Status: Up/d' | cut -d"(" -f2-  > gnmap_tmp2.tmp

paste nmap_tmp.tmp gnmap_tmp1.tmp gnmap_tmp2.tmp | while IFS="$(printf '\t')" read -r f1 f2 f3
do
    printf "$f2"
    printf "$f1"
    printf "$f3\n"
done

rm nmap_tmp.tmp
rm gnmap_tmp1.tmp
rm gnmap_tmp2.tmp
