#!/bin/bash

if [ "$#" -ne 1 ]; then
echo "Usage - ./udp_sweep.sh [/24 network address]"
echo "Example - ./udp_sweep.sh 192.168.0.0"
echo "Example will perform a UDP ping sweep of the 192.168.8.8/24 network and output to an output.txt file"
exit
fi

prefix=$(echo $1 | cut -d '.' -f 1-3)

for addr in $(seq 1 254); do
hping3 $prefix.$addr --udp -c 1 >> handle.txt;
done

grep Unreachable handle.txt | cut -d' ' -f5 | cut -d'=' -f2 >> output.txt
rm handle.txt
