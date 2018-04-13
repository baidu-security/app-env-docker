#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting SpringBoot server ..'
echo '    - Logging to /var/log/springboot.log'
nohup /jdk/bin/java -jar /root/springboot.jar --server.port=80 --server.address=0.0.0.0 &> /var/log/sprintboot.log &

while true
do
	curl -I 127.0.0.1 &>/dev/null && break
	sleep 1
done

echo '[-] Exploit script'
echo ' -  python /root/run.py http://127.0.0.1 "cat /etc/hosts"'

exec /etc/init.d/shell.sh /root/
