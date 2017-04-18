#!/bin/bash
# executed at /users/daniar/

# Set env variables
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/
export HADOOP_HOME=~/hadoop

# Prepare temp folder
sudo mkdir -p /tmp/hadoop-ucare /tmp/hadoop-core 
sudo chown -R $USER:cs331-uc /tmp/hadoop-ucare /tmp/hadoop-core 
sudo chmod -R 775 /tmp/hadoop-ucare /tmp/hadoop-core 

DIR=/users/daniar/hadoop
if [ -d "$DIR" ]; then
    printf '%s\n' "Removing Lock ($DIR)"
    rm -rf "$DIR"
fi

mkdir hadoop
cd hadoop
git init

# Fetching codes from github
git remote add ucare-github-dan https://github.com/daniarherikurniawan/Chameleon512.git
git pull ucare-github-dan master --depth=20
git checkout master

# compile the code
ant mvn-install

# the conf is changed when compiled, so we need to re pull it from github
git checkout conf/core-site.xml
git checkout conf/hadoop-env.sh
git checkout conf/hdfs-site.xml
git checkout conf/mapred-site.xml
git checkout conf/slaves
git checkout conf/masters
git pull ucare-github-dan master

