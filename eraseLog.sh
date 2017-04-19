
cd hadoop/logs/

echo "" > hadoop-daniar-namenode-node-0.ucare.edu.log

counter=1
while [ $counter -lt $1 ]
do
	echo ....... Erasing Log of Node-$counter
	echo "" > hadoop-daniar-datanode-node-$counter.ucare.edu.log &
	echo "" > hadoop-daniar-datanode-node-$counter.ucare.edu.log &
	((counter++))
done

wait
echo All subshells finished
echo Erasing logs contents are finished