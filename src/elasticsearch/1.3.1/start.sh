#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Apache'
apachectl -k start

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

echo '[-] Starting ElasticSearch'
bash /elasticsearch/bin/elasticsearch

# cd /elasticsearch/
# /bin/bash

