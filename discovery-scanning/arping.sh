#!/bin/bash

if [ "$#" -ne 1 ]; then
echo "Usage - ./arping.sh [interface]"
echo "Example - ./arping.sh eth0"
echo "Example will perform an ARP scan of the local subnet of eth0"
exit
fi

interface=$1
prefix=$(ifconfig $interface | grep inet | cut -d':' -f2 | cut -d' ' -f10 | cut -d'.' -f1-3)

for addr in $(seq 1 254); do
arping -c 1 $prefix.$addr | grep bytes | cut -d' ' -f5 | cut -d'(' -f2 | cut -d')' -f1 &
done

