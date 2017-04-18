#!/bin/bash
# executed at /users/daniar/

# Set env variables

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop

cd hadoop/

git pull ucare-github-dan master

bin/hadoop dfsadmin -refreshNodes