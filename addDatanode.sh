#!/bin/bash
# A Bash script, by Daniar

# Set env variables
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop

cd hadoop/

bin/hadoop-daemon.sh start datanode
bin/hadoop-daemon.sh start tasktracker
