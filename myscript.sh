#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh

echo ================================================
echo                MY START SCRIPT
echo ================================================
echo Starting the script!

echo How many nodes on this experiment?
read maxNodes

echo What is the HDFS destination folder?
read hdfsFolder

echo How many copy of $hdfsFolder? "(5 for 50k blocks)"
read numCopy

echo How many threads of copyFromLocal? 
read numThreads

echo  
echo ================================================
echo  

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop

# host=node-0.$projURI


# ssh $host 'bash -s' < startNNDN.sh

echo ...... Finished Starting DN and NN

echo  
echo ...... Starting $numThreads threads of clearing and preparring fresh /tmp/hadoop *

counter=0
while [ $counter -lt $numThreads ]
do
	host=node-$counter
	(echo "working on $host"; ssh $host 'bash -s' < slavescript.sh ) &
	((counter++))
done

wait
echo All subshells finished

# counter=0
# while [ $counter -lt $numThreads ]
# do
# 	host=node-$counter
# 	(echo "output from $host"; ssh $host 'bash -s' < mapredscript.sh $counter$hdfsFolder $numCopy) &
# 	((counter++))
# done

# wait
# echo All subshells finished

echo 	$host:50070 
echo 	$host:50030 

echo All done

exit