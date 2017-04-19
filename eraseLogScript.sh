#!/bin/bash
# A Bash script, by Daniar
echo ================================================
echo                   ERASE LOGS
echo ================================================

echo How many nodes on this experiment?
read maxNodes

projURI=ucare.edu
host=node-0.$projURI

ssh $host 'bash -s' < eraseLog.sh $maxNodes
