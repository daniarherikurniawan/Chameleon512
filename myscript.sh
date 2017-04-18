#!/bin/bash
# A Bash script, by Daniar
# chmod 755 myscript.sh

echo ================================================
echo                MY START SCRIPT
echo ================================================
echo Starting the script!

echo How many nodes on this experiment?
read maxNodes

echo What is the HDFS destination folder?
read hdfsFolder

echo How many copy of $hdfsFolder? "(5 for 50k blocks)"
read numCopy

echo How many threads of copyFromLocal? 
read numThreads

echo  
echo ================================================
echo  

git add --all .
git commit -m "update the latest code" -a
git push origin master
echo Finished updating git codes!

projURI=hadoopcluster.cs331-uc.emulab.net


counter=0
while [ $counter -lt $maxNodes ]
do
	host=node-$counter.$projURI
	echo 
	echo node: $host
	echo ...... START Scanning ssh fingerprint 
	ssh-keygen -R $host
	ssh-keyscan $host >> ~/.ssh/known_hosts 
	echo ...... END Scanning ssh fingerprint 

	((counter++))
done


counter=0
while [ $counter -lt $maxNodes ]
do
	host=node-$counter.$projURI
	if [ $counter -eq 0 ]
	then
		ssh $host 'bash -s' < masterscript.sh $maxNodes
	else
		ssh $host 'bash -s' < slavescript.sh $maxNodes 
	fi

	((counter++))
done

host=node-0.$projURI


ssh $host 'bash -s' < startNNDN.sh

echo ...... Finished Starting DN and NN

echo  
echo ...... Starting $numThreads threads of HDFS write using copyFromLocal

counter=0
while [ $counter -lt $numThreads ]
do
	host=node-$counter.$projURI
	(echo "output from $host"; ssh $host 'bash -s' < mapredscript.sh $counter$hdfsFolder $numCopy) &
	((counter++))
done

wait
echo All subshells finished

host=node-0.$projURI

ssh $host 'bash -s' < "eraseNNLog.sh"

echo Erasing namenode logs is done
echo 	$host:50070 
echo 	$host:50030 

echo All done

exit