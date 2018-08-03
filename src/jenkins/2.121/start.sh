#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting jenkins ..'
cd /root/
nohup /jdk/bin/java -jar jenkins.war --httpPort=80 &> /jenkins.log &

while true
do
	curl -I 127.0.0.1:80 2>/dev/null && break
	sleep 1
done



exec /etc/init.d/shell.sh /root/
