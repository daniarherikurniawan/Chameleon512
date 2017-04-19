#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh
echo ================================================
echo                 ADD DATANODE
echo ================================================
echo Start from node?
read counter

echo Finished on node?
read maxNodes

while [ $counter -le $maxNodes ]
do
	host=node-$counter
	
	ssh $host 'bash -s' < addDatanode.sh
	echo ..... $host added as datanode

	((counter++))
done