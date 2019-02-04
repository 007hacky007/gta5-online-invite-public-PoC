# GTA 5 Online Invite-only  public lobby PoC

This is proof of concept of the invite-only public GTA 5 Online lobby.
Tested on PS4, but should work on any platform as the p2p architecture 
used in GTA V Online should be same on all platforms. 

## Requirements
- Linux box (tested on Kali 1.1.0)
- two ethernet interfaces to bridge them (some chinese 100 Mbps will do the work)
- public IPv4 or IPv6 (or VPN to some box with public IP)
- PHP7
- ipset
- iptables
- br_netfilter module 

## Usage
1) Connect firewall box to your switch/router in one ethernet interface
2) Connect your PS4 to your firewall box in the second ethernet interface
of your firewall box
3) Start the **bridgeUp.sh** (you would probably need to assign IP to
the bridge iface and tune the default route)
4) Start the **GtaFw.sh** 
5) Fire-up PHP server: **php -S '[::1]:1337'** in the **firewall** 
directory
6) Fill in the public IP address of the firewall box in the **web/gta.php** file
7) Put the **gta.php** file to some web server, which is publicly 
available to the Internet
8) Distribute the URL to the **gta.php** to your friends, which
you want to invite to your lobby
9) Start the GTA 5 Online (public), you should end up in public solo 
lobby
10) Let your friends connect to your lobby via PSN (via PS4 main menu)
it may not be possible to join via GTA *Friends* menu


## Possible improvements
- reverse approach (blacklist instead of the whitelist)
- log the IPs of the connected players (via libpcap) and blacklist 
randoms if needed

## Little bit of technical background
- this works because GTA5 Online architecture is p2p
- so this is set or very simple scripts, which basically 
    - creates Linux bridge
    - creates UDP firewall
    - uses ipset to whitelist IPs (of invited players)
-  it consists of two parts
    - firewall
        -  intended to be running in your home network, on some Linux box
        (possibly SBC like Raspberry Pi or Orange Pi) with two ethernet 
        interfaces and public IPv4 or IPv6 IP address
    -  web
        -  simple PHP script, which calls firewall and passes 
        the visitor's REMOTE_ADDR for whitelisting
        
