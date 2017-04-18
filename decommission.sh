#!/bin/bash
# executed at /users/daniar/

# Set env variables
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/
export HADOOP_HOME=/users/daniar/hadoop

cd hadoop/

git pull ucare-github-dan master

bin/hadoop dfsadmin -refreshNodes