#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting SpringBoot server ..'
echo ' -  Logging to /webwolf.log'
nohup /jdk/bin/java -jar /webwolf.jar --server.port=80 --server.address=0.0.0.0 &> /webwolf.log &

while true
do
	curl -I 127.0.0.1 &>/dev/null && break
	sleep 1
done

exec /etc/init.d/shell.sh /
