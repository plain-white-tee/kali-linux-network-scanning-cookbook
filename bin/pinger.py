#!/usr/bin/python3

import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)
from scapy.all import *

if len(sys.argv) != 2:
    print("Usage - ./pinger.py [interface]")
    print("Example - ./pinger.py 10.0.0.010.0.0.010.0.0.010.0.0.010.0.0.010.0.0.010.0.0.010.0.0.010.0.0.010.0.0.0")
    print("Example will perform an ARP scan of the local subnet to which eth0 is assigned")
    sys.exit()

address = str(sys.argv[1])
prefix = f"{address.split('.')[0]}.{address.split('.')[1]}.{address.split('.')[2]}."

for addr in range(0,254):
    answer = sr1(ARP(pdst=prefix+str(addr)),timeout=1,verbose=0)
    if answer == None:
        pass
    else:
        print(prefix+str(addr))
