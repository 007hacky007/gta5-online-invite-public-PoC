#!/bin/bash
iptables -F
ipset create gta hash:ip # ignore the error when starting repeatedly, as the hash table already exist
iptables -A FORWARD -s 185.56.65.0/24 -j ACCEPT # some R* servers below
iptables -A FORWARD -d 185.56.65.0/24 -j ACCEPT       
iptables -A FORWARD -s 52.40.62.0/24 -j ACCEPT       
iptables -A FORWARD -d 52.40.62.0/24 -j ACCEPT 
iptables -A FORWARD -m set --match-set gta src -j ACCEPT
iptables -A FORWARD -m set --match-set gta dst -j ACCEPT      
iptables -A FORWARD -p udp -m udp --sport 53 -j ACCEPT # obviously allow DNS
iptables -A FORWARD -p udp -m multiport --dports 9296,9297,9303 -j ACCEPT # allow some PSN services (remote play)
iptables -A FORWARD -p udp -m udp --dport 1000:65535 -j DROP
# TODO: save ipset to the file, so we keep IPs across reboots
