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

echo How many threads of copyFromLocal? 
read numThreads

echo  
echo ================================================
echo  

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop

# host=node-0.$projURI

rm -rf logs/

git pull ucare-github-dan master --depth=20

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

echo Compiling HADOOP 0.20

ant mvn-install

git checkout conf/core-site.xml
git checkout conf/hadoop-env.sh
git checkout conf/hdfs-site.xml
git checkout conf/mapred-site.xml
git checkout conf/slaves
git checkout conf/masters

git pull ucare-github-dan master

echo Y | bin/hadoop namenode -format 

./bin/start-all.sh

# counter=0
# while [ $counter -lt $numThreads ]
# do
# 	host=node-$counter
# 	(echo "output from $host"; ssh $host 'bash -s' < mapredscript.sh $counter$hdfsFolder $numCopy) &
# 	((counter++))
# done

# wait
echo Cluster condition
bin/hadoop fsck -racks

echo 	$host:50070 
echo 	$host:50030 

echo All done

exit