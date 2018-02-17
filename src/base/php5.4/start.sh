#!/bin/bash

echo '[-] Starting Apache'
apachectl -k start

echo '[-] Starting MariaDB'
nohup mysqld_safe --datadir=/var/lib/mysql &>/dev/null &

echo '[-] Dropping shell'
/bin/bash

