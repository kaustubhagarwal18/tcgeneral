# tcgeneral

General commands of tc to understand traffic flow in Linux
Commands

- plugin throughput set-all 0x0001 10 10 127 1 0 100000
* plugin throughput start
* plugin throughput print-counters

* plugin mfglib status
* plugin mfglib start 1
* plugin mfglib set-channel 25

* tcpdump -c 10 dst 192.168.1.194 and src 192.168.1.182 >> file.txt   # capture first 10 packets and then quit
