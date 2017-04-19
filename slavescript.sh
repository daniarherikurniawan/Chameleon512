#!/bin/bash
# executed at /users/daniar/

# Set env variables

# export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
# export HADOOP_HOME=/home/ubuntu/hadoop

# Prepare temp folder
rm -rf /tmp/hadoop-ucare/
rm -rf /tmp/hadoop-core/


sudo mkdir -p /tmp/hadoop-ucare /tmp/hadoop-core 
sudo chown -R $USER:ubuntu /tmp/hadoop-ucare /tmp/hadoop-core 
sudo chmod -R 775 /tmp/hadoop-ucare /tmp/hadoop-core 
# ###rm -rf known_hosts.*

# scan ssh fingerprints for the cluster
# counter=0
# while [ $counter -lt $1 ]
# do
# 	( 
# 		host=node-$counter.ucare.edu;
# 		ssh-keygen -R $host;
# 		ssh-keyscan $host >> ~/.ssh/known_hosts 
# 	) &
# 	((counter++))
# done

# wait
# echo All subshells scanning ssh fingerprints are finished

# switching the directory
# cd /home/ubuntu/hadoop

# format namenode before using it
# bin/hadoop namenode -format

# Start master node 
# ./bin/stop-mapred.sh
# ./bin/start-mapred.sh
