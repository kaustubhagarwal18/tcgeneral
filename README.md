# tcgeneral

ebtables -I FORWARD -d D0:CF:5E:00:BF:83 -j CONTINUE --log-prefix "LOGWATCHERZIGBEE"

Firewall Location - /etc/config/firewall    ----- added lan to lan forwarding 

Rule for logging --- iptables -t raw -A PREROUTING --destination 192.168.1.194 -j LOG --log-prefix "LOGWATCHERZIGBEE"  either in LUCI or in file /etc/firewall.user

Enable counters in file - /etc/sysctl.conf

net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-arptables=1
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1


service firewall restart   -- restart firewall to activate rules


General commands of tc to understand traffic flow in Linux
Commands

* iperf3 -c 192.168.1.182 -V -u -t 30iperf3 -c 192.168.1.182 -V -u -t 30 - Router ,, iperf3 -s --- laptop

* tcpdump -c 10 dst 192.168.1.194 and src 192.168.1.182 >> file.txt   # capture first 10 packets and then quit

* ip link set dev wlan0 qlen 200    -- change qlen   , ip link to check all interfaces  
# Simplicity Studio commands - 

- plugin throughput set-all 0x0001 10 10 127 1 0 100000
* plugin throughput start
* plugin throughput print-counters

* plugin mfglib status
* plugin mfglib start 1
* plugin mfglib set-channel 25


