#!/bin/sh

var1=2
while [ $var1 == 2 ]
do
if [ -s file.txt ]
then
        var1=3
        echo disable radio
        ifconfig wlan0 down
        sleep 0.01
        echo enable radio
        ifconfig wlan0 up

fi
echo $var1
done
