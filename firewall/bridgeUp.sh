#!/bin/bash
brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig br0 up
ifconfig eht1 up
# TODO: grab some IP with dhclient for the bridge iface
# TODO: fix the route, the default route should use br0 instead of the previous iface
php -S '[::1]:1337' # you may want to change this to '0.0.0.0:1337' if you want to use IPv4