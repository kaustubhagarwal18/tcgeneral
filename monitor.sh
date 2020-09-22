var1=2
while [ $var1 == 2 ]
do
if grep -q "LOGWATCHERZIGBEE" file.txt; then
echo "RATE LIMITING QDISC"
./tbf.sh
var1=3
rm file.txt
fi
done
