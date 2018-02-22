#!/bin/bash

echo '[-] Starting Apache'
apachectl -k start

echo '[-] Starting MariaDB'
nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

echo '[-] Waiting for MySQL to start ...'
while true
do
	mysql -uroot -e 'select 1' &>/dev/null && break
done

echo '[-] Dropping shell'
/bin/bash

