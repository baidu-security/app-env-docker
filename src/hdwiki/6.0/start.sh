#!/bin/bash

/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

echo '[-] Accessing 127.0.0.1 for the first time'
curl 127.0.0.1 &>/dev/null

echo '[-] Setting docker ip in web config file'
bash -c "/root/change-config.sh"
exec /etc/init.d/shell.sh /var/www/html

