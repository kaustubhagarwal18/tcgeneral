#!/bin/sh
#tc -s qdisc show dev wlan0
#tc qdisc del dev wlan0 root
tc qdisc add dev wlan0 root handle 1: htb default 10
tc class add dev wlan0 parent 1: classid 1:1 htb rate 2mbit  # 2Megabits/sec 
tc class add dev wlan0 parent 1:1 classid 1:10 htb prio 1 rate 0.001mbit ceil 2mbit
tc class add dev wlan0 parent 1:1 classid 1:20 htb prio 0 rate 2mbit ceil 2mbit 

tc filter add dev wlan0 parent 1: protocol ip matchall flowid 1:1
tc filter add dev wlan0 parent 1:1 u32 match ip dst 192.168.1.180  flowid 1:20

# statistics

tc -s -g class show dev wlan0
tc -s class show dev wlan0 parent 1:
#tc -s filter show dev wlan0 parent 1:1

sleep 0.2

tc -s -g class show dev wlan0
tc -s class show dev wlan0 parent 1:
#tc -s filter show dev wlan0 parent 1:1

#tc class change dev wlan0 parent 1: classid 1:1 htb rate 8000kbps burst 2000000000 cburst 2000000000
#tc class del dev wlan0 parent 1:1 classid 1:10

#sleep 4.0

#tc -s -g class show dev wlan0
#tc class change dev wlan0 parent 1: classid 1:1 htb  rate 8000kbps burst 122000000
tc qdisc del dev wlan0 root
#tc qdisc change dev wlan0 root tbf rate 100000000 burst 122000000 latency 100ms
#tc -s qdisc show dev wlan0
