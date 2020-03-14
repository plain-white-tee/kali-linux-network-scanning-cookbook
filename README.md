# Notes and files for Kali Linux Network Scanning Cookbook

### 2 Discovery Scanning

#### Using Scapy to perform layer 2 discovery

`arp_disc.py`<br>
`arp_disc_file.py` uses a file of addresses to do the same thing.

These scripts use the `sr1()` function in Scapy to inject a packet and wait for a single response.

#### Using ARPing to perform layer 2 discovery

`arping [ip] -c 1`

`arp_disc.sh` uses `arping` to scan the address range of the given interface.

