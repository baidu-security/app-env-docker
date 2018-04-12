#!/bin/bash

echo '[-] Starting Apache'
apachectl -k start

echo '[-] Starting MariaDB'
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

echo '[-] Waiting for MySQL to start ...'
while true
do
	mysql -uroot -e 'select 1' &>/dev/null && break
	sleep 1
done

echo '[-] Accessing 127.0.0.1 for the first time'
curl 127.0.0.1 &>/dev/null

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /var/www/html
/bin/bash

