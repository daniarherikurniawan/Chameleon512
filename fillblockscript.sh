#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh

echo ================================================
echo                MY START SCRIPT
echo ================================================
echo Starting the script!

echo What is the HDFS destination folder?
read hdfsFolder

echo How many copy of $hdfsFolder? "(5 for 50k blocks)"
read numCopy

echo How many threads of copyFromLocal? "(512 will do parallel on node-1 .. node-512"
read numThreads

echo  
echo ================================================
echo  

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop


counter=1
while [ $counter -le $numThreads ]
do
	host=node-$counter
	(echo "output from $host"; ssh $host 'bash -s' < mapredscript.sh $counter$hdfsFolder $numCopy) &
	((counter++))
done

wait
echo Cluster condition
bin/hadoop fsck -racks

echo 	$host:50070 
echo 	$host:50030 

echo All done
# wget node-0.ucare.edu:50070/dfsnodelist.jsp?whatNodes=LIVE
# wget node-0.ucare.edu:50070/dfshealth.jsp
# cat * | grep startTimeRefference
exit