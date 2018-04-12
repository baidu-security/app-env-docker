#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting MySQL'
/etc/init.d/mysql.sh start

echo '[-] Starting JBoss 4.0'
echo ' -  Logging to /var/log/jboss.log'
nohup bash /jboss/bin/run.sh -b 0.0.0.0 &> /var/log/jboss.log &

echo '[-] Waiting for JBoss to start ...'
while true
do
	curl -I 127.0.0.1:8080 &>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /jboss/
/bin/bash

