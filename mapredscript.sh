#!/bin/bash
# A Bash script, by Daniar

# Set env variables

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop

cd hadoop/
# git pull ucare-github-dan master



fileName=gutenberg
destination=/$1
echo ..... Saving $fileName files to HDFS

maxCopy=$2
counter=1
while [ $counter -le $maxCopy ]
do
	( 
		bin/hadoop dfs -copyFromLocal $fileName $destination$counter;
		echo Folder $fileName is copied to $destination$counter
	) &

	((counter++))
done

wait
echo All subshells copying local files to hdfs are finished
echo  
echo ..... Finish saving $fileName files to HDFS
echo  
echo ..... Start MapRed Job
# bin/hadoop jar build/hadoop-examples-0.20.3-SNAPSHOT.jar wordcount $destination $destination-output
echo ..... Finish MapRed Job
echo  
echo HDFS directory
bin/hadoop dfs -ls /