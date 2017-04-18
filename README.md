
===================== DANIAR ======================================
setting :

once you download it, put it into your /.ssh/ dir, and then add these lines to your /.ssh/config

Host cc214
  Hostname 130.202.88.214
  User cc
  IdentityFile ~/.ssh/ucare-chameleon.pem
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no

then, do this to get into my VM,

ssh cc214

sudo su - stack
sudo ip netns exec qrouter-d1ae3e91-bfb1-4655-9454-b385560a8228 ssh -i ~/.ssh/ucare-chameleon.pem ubuntu@10.1.3.5
ssh node-0

check if you can see 512 hadoop datanodes:
hadoop dfsadmin -report



clone : 


branch=ucare-HDFS-395
rm -rf $branch
mkdir $branch
cd $branch
git init
git remote add -t $branch -f origin https://github.com/ucare-uchicago/hadoop.git
git checkout $branch
cd ..


https://hadoop.apache.org/docs/r0.23.11/hadoop-project-dist/hadoop-common/SingleCluster.html
 - install mvn 
 - instruction
 	$ mvn clean install -DskipTests
	$ cd hadoop-mapreduce-project
	$ mvn clean install assembly:assembly -Pnative
[failed]

http://www.michael-noll.com/blog/2011/04/14/building-an-hadoop-0-20-x-version-for-hbase-0-90-2/
- install java set java home
- install maven
- install ant
	# Run the build process
	$ ant mvn-install

	# Optional: run the full test suite or just the core test suite
	$ ant test
	$ ant test-core

http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-single-node-cluster/

set env variable at ~/.bash_profile
sudo chown -R daniar hadoop-20

$ sudo mkdir -p /app/hadoop/tmp
$ sudo chown daniar /app/hadoop/tmp
# ...and if you want to tighten up security, chmod from 755 to 750...
$ sudo chmod 750 /app/hadoop/tmp

source .bash_profile

bin/hadoop dfs -copyFromLocal gutenberg /gutenberg

================= MAPREDUCE JOB ===================
javac -classpath ../build/hadoop-core-0.20.3-SNAPSHOT.jar  WordCount.java
jar -cvf WordCount.jar *.class

just this : bin/hadoop jar build/hadoop-examples-0.20.3-SNAPSHOT.jar wordcount /gutenberg /gutenberg-output

===================== NODE ACCESS =====================
node-0.hadoopcluster.ucare.emulab.net 
node-1.hadoopcluster.ucare.emulab.net 
node-2.hadoopcluster.ucare.emulab.net 
node-3.hadoopcluster.ucare.emulab.net 




==================== SSH =========================
sudo vim /etc/ssh/ssh_config
Host 155.98.39.*
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null


===================== RUN ======================
./myscript.sh

cd /mnt/extra/hadoop/
ant mvn-install
sudo apt-get install vim
vim $HOME/.bashrc
```
	# Set Hadoop-related environment variables
	export HADOOP_HOME=/users/daniar/hadoop

	# Set JAVA_HOME (we will also configure JAVA_HOME directly for Hadoop later on)
	export JAVA_HOME=/usr/lib/jvm/java-8-oracle

	# Some convenient aliases and functions for running Hadoop-related commands
	unalias fs &> /dev/null
	alias fs="hadoop fs"
	unalias hls &> /dev/null
	alias hls="fs -ls"

	# Add Hadoop bin/ directory to PATH
	export PATH=$PATH:$HADOOP_HOME/bin
```

JAVA_HOME="/usr/lib/jvm/java-8-oracle"
source /etc/environment

bin/hadoop namenode -format
cd /mnt/extra/hadoop/
./bin/start-all.sh


jps is a god

git pull ucare-github-dan master

git checkout conf/core-site.xml
git checkout conf/hdfs-site.xml
git checkout conf/mapred-site.xml

./bin/stop-all.sh


git checkout runbench.sh
git pull ucare-github-dan master
vim runbench.sh


ssh users.emulab.net
ssh node-0.HadoopCluster.cs331-uc.emulab.net

ssh-keyscan node-12.hadoopcluster.cs331-uc.emulab.net >> ~/.ssh/known_hosts

sudo vi /etc/bash.bashrc

JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/bin/java
export JAVA_HOME
PATH=$PATH:/usr/lib/jvm/java-8-oracle/jre/bin
export PATH

bash
host=node-16.hadoopcluster.cs331-uc.emulab.net
ssh-keygen -R host=node-0.hadoopcluster.cs331-uc.emulab.net
	ssh-keyscan node-2.testspark.cs331-uc.emulab.net >> ~/.ssh/known_hosts

node-1.testspark.cs331-uc.emulab.net
node-2.testspark.cs331-uc.emulab.net


/etc/init.d/ssh restart

node-0.riza-sandbox.ucare.emulab.net

ssh-copy-id -i $HOME/.ssh/id_rsa.pub $host

TEST MAPRED
bash
bin/hadoop dfs -copyFromLocal gutenberg /gutenberg
bin/hadoop jar build/hadoop-examples-0.20.3-SNAPSHOT.jar wordcount /gutenberg /gutenberg-output


bin/hadoop dfs -ls /

###UPDATING

setenv JAVA_HOME /usr/lib/jvm/java-8-oracle/jre/
setenv HADOOP_HOME /users/daniar/hadoop

cd /users/daniar/hadoop/
git pull ucare-github-dan master
./bin/stop-all.sh
bin/hadoop namenode -format
./bin/start-dfs.sh
./bin/start-mapred.sh




./bin/stop-dfs.sh

adding datanode on the fly : 
	 bin/hadoop-daemon.sh start datanode
	 bin/hadoop-daemon.sh start tasktracker

removing datanode on the fly :
	http://maheshwaranm.blogspot.co.id/2013/07/how-to-decommission-nodes.html
	155.98.39.129
	155.98.39.126
	155.98.39.119
	logging : http://pc284.emulab.net:50070/logs/hadoop-daniar-namenode-node-0.hadoopcluster.cs331-uc.emulab.net.log

download logs :
	aria2c -x 16 http://pc284.emulab.net:50070/logs/hadoop-daniar-namenode-node-0.hadoopcluster.cs331-uc.emulab.net.log


[4/11/17, 7:26:13 PM] Riza Suminto: Go back to your unmodified 0.20, and just fill up your cluster with enough datablocks as you did on your unit test,
[4/11/17, 7:26:43 PM] Riza Suminto: there is an hdfs command to invoke FullBlockReport from all nodes at once,
[4/11/17, 7:27:46 PM] Riza Suminto: https://hadoop.apache.org/docs/r2.7.1/hadoop-project-dist/hadoop-hdfs/HDFSCommands.html#dfsadmin
[4/11/17, 7:28:05 PM] Riza Suminto: hdfs dfsadmin -triggerBlockReport
[4/11/17, 7:29:11 PM] Riza Suminto: you only need to measure NameNode time and CPU Usage during full block report processing,


clean up log 
node-0:~/hadoop/logs> echo "" > hadoop-daniar-namenode-node-0.hadoopcluster.cs331-uc.emulab.net.log
node-0:~/hadoop/logs> ls -lah hadoop-daniar-namenode-node-0.hadoopcluster.cs331-uc.emulab.net.log


### Important:

setenv JAVA_HOME /usr/lib/jvm/java-8-oracle/jre/
setenv HADOOP_HOME /users/daniar/hadoop
bin/hadoop dfsadmin -getDatanodeInfo node-16.hadoopcluster.cs331-uc.emulab.net
bin/hadoop fsck -racks

ssh pc294.emulab.net -v
https://www.emulab.net/gensslcert.php3?user=87860
re generate id_rsa through the EMulab UI and extract private and pubkey from .pem