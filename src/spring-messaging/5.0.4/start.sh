#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting SpringBoot server ..'
echo ' -  Logging to /springboot.log'
nohup /jdk/bin/java -jar /root/springboot.jar --server.port=80 --server.address=0.0.0.0 --debug --trace &> /sprintboot.log &

while true
do
	curl -I 127.0.0.1 &>/dev/null && break
	sleep 1
done

exec /etc/init.d/shell.sh /root/
