#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Tomcat 7.0'
bash /tomcat/bin/startup.sh

echo '[-] Starting MySQL'
/etc/init.d/mysql.sh start

echo '[-] Waiting for Tomcat to start ...'
while true
do
	curl -I 127.0.0.1 2>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /tomcat/
/bin/bash

