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


# host=node-0.$projURI


# ssh $host 'bash -s' < startNNDN.sh

echo ...... Finished Starting DN and NN

echo  
echo ...... Starting $numThreads threads of HDFS write using copyFromLocal

counter=0
while [ $counter -lt $numThreads ]
do
	host=node-$counter
	(echo "output from $host"; ssh $host 'bash -s' < mapredscript.sh $counter$hdfsFolder $numCopy) &
	((counter++))
done

wait
echo All subshells finished

echo 	$host:50070 
echo 	$host:50030 

echo All done

exit