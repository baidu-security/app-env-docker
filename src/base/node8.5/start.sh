#!/bin/bash

echo '[-] Starting MySQL'
/etc/init.d/mysql.sh start

exec /etc/init.d/shell.sh /tmp
