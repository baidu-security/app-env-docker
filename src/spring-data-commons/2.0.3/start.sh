#!/bin/bash

export JAVA_HOME=/jdk

echo '[-] Starting SpringBoot server ..'
echo ' -  Logging to /springboot.log'
nohup bash /root/springboot.sh &> /springboot.log &

while true
do
	curl -I 127.0.0.1 &>/dev/null && break
	sleep 1
done

exec /etc/init.d/shell.sh /root/
