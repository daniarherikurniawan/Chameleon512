#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh

echo ================================================
echo                  DOWNLOAD LOGS
echo ================================================
echo Starting the script!
echo  
echo How many nodes on this experiment?
read maxNodes

rm -rf logs/
mkdir logs/
cd logs/
project=ucare.edu
host=http://node-0.$project:50070

aria2c -x 16 -o NN.log $host/logs/hadoop-daniar-namenode-node-0.$project.log &

echo ..... Finished download namenode logs
echo 
echo ..... Starting download datanode logs
counter=1
while [ $counter -lt $maxNodes ]
do
	aria2c -x 16 -o DN-$counter.log $host/logs/hadoop-daniar-datanode-node-$counter.$project.log

	((counter++))
done

wait
echo All subshells finished