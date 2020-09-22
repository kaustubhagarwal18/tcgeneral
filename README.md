ssh into Router ssh root@192.168.1.1

# commands to enable logging of packets in the firewall
Enable counters in file - /etc/sysctl.conf  to allow packets traversing the bridge-lan to be sent to iptables for processing

net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-arptables=1
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1

ebtables -I FORWARD -d D0:CF:5E:00:BF:83 -j CONTINUE --log-prefix "LOGWATCHERZIGBEE"

Firewall Location - /etc/config/firewall    ----- add lan to lan forwarding rule 

Rule for logging --- iptables -t raw -A PREROUTING --destination 192.168.1.194 -j LOG --log-prefix "LOGWATCHERZIGBEE"  either in LUCI or add in file /etc/firewall.user

service firewall restart   -- restart firewall to activate rules


# Execution

start a terminal with logread -f > file.txt                 # to store and monitor logread 

run ./monitor.sh                                            # to search for "LOGWATCHERZIGBEE" and execute either tbf.sh or htb.sh


# Simplicity Studio commands - 

- plugin throughput set-all 0x0001 10 10 127 1 0 100000
* plugin throughput start
* plugin throughput print-counters

* plugin mfglib status
* plugin mfglib start 1
* plugin mfglib set-channel 25


General commands of tc to understand traffic flow in Linux
Commands

* iperf3 -c 192.168.1.182 -V -u -t 30iperf3 -c 192.168.1.182 -V -u -t 30 - Router ,, iperf3 -s --- laptop

* tcpdump -c 10 dst 192.168.1.194 and src 192.168.1.182 >> file.txt   # capture first 10 packets and then quit

* ip link set dev wlan0 qlen 200    -- change qlen   , ip link to check all interfaces  



