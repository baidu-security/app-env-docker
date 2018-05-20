#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Weblogic - medrec'
echo ' -  Logging to /weblogic.log'
nohup /opt/bea/wlserver_10.3/samples/domains/medrec/bin/startWebLogic.sh &> /weblogic.log &

echo '[-] Waiting for Weblogic server to start ...'
while true
do
	curl -I 127.0.0.1:7011 &>/dev/null && break
	sleep 1
done

exec /etc/init.d/shell.sh /
