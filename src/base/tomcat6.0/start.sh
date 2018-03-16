#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Tomcat 6.0'
bash /tomcat/bin/startup.sh

echo '[-] Starting MariaDB'
nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

echo '[-] Waiting for MySQL to start ...'
while true
do
	mysql -uroot -e 'select 1' &>/dev/null && break
done

echo '[-] Waiting for Tomcat to start ...'
sleep 3 && curl -I 127.0.0.1

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /tomcat/
/bin/bash

