#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Apache ActiveMQ'
/activemq/bin/activemq start

echo '[-] Waiting for ActiveMQ to start'
while true
do
	curl -I 127.0.0.1:8161 2>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash
