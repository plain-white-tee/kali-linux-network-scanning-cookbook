#!/usr/bin/python3

import logging
import subprocess
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)
from scapy.all import *

if len(sys.argv) != 2:
    print("Usage - ./arp_disc.py [interface]")
    print("Example - ./arp_disc.py eth0")
    print("Example will perform an ARP scan of the local subnet to which eth0 is assigned")
    sys.exit()

interface = str(sys.argv[1])

ip = subprocess.check_output("ip a | grep '^\s.*inet.*" + interface + "$' | cut -d ' ' -f6 | cut -d '/' -f1", shell=True).strip().decode('utf8')
#prefix = ip.split('.')[0] + '.' + ip.split('.')[1] + '.' + ip.split('.')[2] + '.'
prefix = f"{ip.split('.')[0]}.{ip.split('.')[1]}.{ip.split('.')[2]}."

for addr in range(0,254):
    answer = sr1(ARP(pdst=prefix+str(addr)),timeout=1,verbose=0)
    if answer == None:
        pass
    else:
        print(prefix+str(addr))
