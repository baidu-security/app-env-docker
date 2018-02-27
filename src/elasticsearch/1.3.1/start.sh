#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Apache'
apachectl -k start

echo '[-] Starting ElasticSearch'
bash /elasticsearch/bin/elasticsearch -d

echo '[-] Waiting for ElasticSearch to start ...'
while true
do
	curl -I 127.0.0.1:9200 &>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /elasticsearch/
/bin/bash

