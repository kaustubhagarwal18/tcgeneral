#!/bin/sh
tc -s qdisc show dev wlan0
tc qdisc add dev wlan0 root tbf rate 30Kbit burst 10kbit latency 1000ms
sleep 0.5
tc -s qdisc show dev wlan0
tc qdisc del dev wlan0 root
tc -s qdisc show dev wlan0
