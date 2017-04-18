#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh

echo ================================================
echo               DECOMMISSION NODE
echo ================================================
# master node
host=node-0.hadoopcluster.cs331-uc.emulab.net

echo Start from node?
read counter

echo Until node?
read maxNodes

file=conf/exclude
rm $file

while [ $counter -le $maxNodes ]
do
	host=node-$counter.hadoopcluster.cs331-uc.emulab.net
	ip=$(ping -c1 -n $host | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")
	echo $ip >> $file

	((counter++))
done
# git add --all .
git commit -m "update excluded node for decommissioning" -a
git push origin master
echo  
echo .....Start decommissioning
ssh $host 'bash -s' < decommission.sh
echo .....Finish decommissioning