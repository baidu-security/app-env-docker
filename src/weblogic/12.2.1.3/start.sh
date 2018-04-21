#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Weblogic - medrec'
echo ' -  Logging to /weblogic.log'
nohup /wls12213/domain/base_domain/bin/startWebLogic.sh &> /weblogic.log &

echo '[-] Waiting for Weblogic server to start ... (very slow)'
while true
do
	curl -I 127.0.0.1:7001 &>/dev/null && break
	sleep 1
done

exec /etc/init.d/shell.sh /
