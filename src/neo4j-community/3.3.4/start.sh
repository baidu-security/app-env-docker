#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting neo4j server'
bash /neo4j/bin/neo4j start

echo '[-] Waiting for neo4j to start ...'
while true
do
	curl -I 127.0.0.1:7474 &>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash

