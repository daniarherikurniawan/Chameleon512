
cd hadoop/logs/

echo "" > hadoop-daniar-namenode-node-0.hadoopcluster.cs331-uc.emulab.net.log

counter=1
while [ $counter -lt $1 ]
do
	echo ....... Erasing Log of Node-$counter
	echo "" > hadoop-daniar-datanode-node-$counter.hadoopcluster.cs331-uc.emulab.net.log &
	echo "" > hadoop-daniar-datanode-node-$counter.hadoopcluster.cs331-uc.emulab.net.log &
	((counter++))
done

wait
echo All subshells finished
echo Erasing logs contents are finished