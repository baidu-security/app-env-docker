#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting MariaDB'
nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

echo '[-] Waiting for MySQL to start ...'
while true
do
	mysql -uroot -e 'select 1' &>/dev/null && break
done

echo '[-] Starting JBoss 4.0'
echo ' -  Logging to /var/log/jboss.log'
nohup bash /jboss/bin/run.sh -b 0.0.0.0 &> /var/log/jboss.log &

echo '[-] Waiting for JBoss to start ...'
while true
do
	curl -I 127.0.0.1:8080 &>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /jboss/
/bin/bash

