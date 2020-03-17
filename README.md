# Notes and files for Kali Linux Network Scanning Cookbook

### 2 Discovery Scanning

#### Using Scapy to perform layer 2 discovery

`arp_disc.py`<br>
`arp_disc_file.py` uses a file of addresses to do the same thing.

These scripts use the `sr1()` function in Scapy to inject a packet and wait for a single response.

#### Using ARPing to perform layer 2 discovery

`arping [ip] -c 1`

`arp_disc.sh` uses `arping` to scan the address range of the given interface.

#### Using Nmap to perform layer 2 discovery

`nmap address -sn` assuming `address` is on the same local subnet, performs a layer 2 ARP scan.<br>
`nmap 192.168.0.0-255 -sn` scans a full `/24` range of addresses.<br>
`nmap -il iplist.txt -sn` scans a list of IP addresses from iplist.txt.

#### Using Scapy to perform layer 3 discovery


