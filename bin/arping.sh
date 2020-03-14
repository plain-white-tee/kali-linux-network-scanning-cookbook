#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage - ./arping.sh [interface]"
    echo "Example - ./arping.sh eth0"
    echo "Example will perform an ARP scan of the local subnet to which eth0 is assigned"
    exit
fi

interface=$1

prefix=$(ip a | grep "^\s*inet.*"$interface"$" | cut -d ' ' -f6 | cut -d '.' -f1-3)

for addr in $(seq 1 254); do
    arping -c 1 $prefix.$addr | grep "bytes from" | cut -d ' ' -f5 | cut -d '(' -f2 | cut -d ')' -f1 &
done
