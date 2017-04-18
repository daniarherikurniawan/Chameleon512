
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/
export HADOOP_HOME=/users/daniar/hadoop

cd hadoop/

# format namenode before using it
echo Y | bin/hadoop namenode -format 

# Start master node 
./bin/start-all.sh