
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_HOME=/home/ubuntu/hadoop

cd hadoop/

# format namenode before using it
echo Y | bin/hadoop namenode -format 

# Start master node 
./bin/start-all.sh