#!/bin/bash

export JAVA_HOME=/jdk/

# /etc/init.d/mysql.sh start

echo '[-] Starting SpringBoot server ..'
echo ' -  Logging to /springboot.log'
nohup bash /root/springboot.sh &> /springboot.log &

while true
do
	curl -I 127.0.0.1 &>/dev/null && break
	sleep 1
done

/etc/init.d/mysql.sh start

echo '[-] Importing sql file'
mysql < /root/database.sql
rm /root/database.sql

exec /etc/init.d/shell.sh /root/
