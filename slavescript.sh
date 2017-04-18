#!/bin/bash
# executed at /users/daniar/

# Set env variables
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/
export HADOOP_HOME=/users/daniar/hadoop

# Prepare temp folder
sudo mkdir -p /tmp/hadoop-ucare /tmp/hadoop-core 
sudo chown -R $USER:cs331-uc /tmp/hadoop-ucare /tmp/hadoop-core 
sudo chmod -R 775 /tmp/hadoop-ucare /tmp/hadoop-core 
# ###rm -rf known_hosts.*

# scan ssh fingerprints for the cluster
# counter=0
# while [ $counter -lt $1 ]
# do
# 	( 
# 		host=node-$counter.hadoopcluster.cs331-uc.emulab.net;
# 		ssh-keygen -R $host;
# 		ssh-keyscan $host >> ~/.ssh/known_hosts 
# 	) &
# 	((counter++))
# done

# wait
# echo All subshells scanning ssh fingerprints are finished

# switching the directory
# cd /users/daniar/hadoop

# format namenode before using it
# bin/hadoop namenode -format

# Start master node 
# ./bin/stop-mapred.sh
# ./bin/start-mapred.sh
