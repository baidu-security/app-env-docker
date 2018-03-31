#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Weblogic - medrec'
echo '    - Logging to /weblogic.log'
nohup /opt/bea/wlserver_10.3/samples/domains/medrec/bin/startWebLogic.sh &> /weblogic.log &

echo '[-] Waiting for Weblogic server to start ...'
while true
do
	curl -I 127.0.0.1:8080 &>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash
