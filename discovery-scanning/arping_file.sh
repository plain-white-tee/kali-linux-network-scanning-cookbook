#!/bin/bash

if [ "$#" -ne 1 ]; then
echo "Usage - ./arping.sh [input file]"
echo "Example - ./arping.sh iplist.txt"
echo "Example will perform an ARP scan of the IP addresses in iplist.txt"
exit
fi

file=$1

for addr in $(cat $file); do
arping -c 1 $addr | grep bytes | cut -d' ' -f5 | cut -d'(' -f2 | cut -d')' -f1 &
done

