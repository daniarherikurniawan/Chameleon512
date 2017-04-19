#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh
echo ================================================
echo                 GET NODE\'s IP
echo ================================================
echo Start from node?
read counter

echo Finished on node?
read maxNodes

rm list_ip.txt

while [ $counter -le $maxNodes ]
do
	host=node-$counter.ucare.edu
	ip=$(ping -c1 -n $host | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")
	echo IP of $host = $ip
	echo $ip >> list_ip.txt

	((counter++))
done