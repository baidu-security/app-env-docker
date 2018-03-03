#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting SpringBoot server ..'
echo ' -  Logging to /var/log/springboot.log'
nohup /jdk/bin/java -jar /root/springboot.jar &> /var/log/sprintboot.log &

while true
do
	curl -I 127.0.0.1:8080 &>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

echo '[-] Exploit script'
echo ' -  python /root/run.py http://127.0.0.1 "cat /etc/hosts"'

cd /root/
/bin/bash