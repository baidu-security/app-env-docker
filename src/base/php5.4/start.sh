#!/bin/bash

chmod -R +x /etc/init.d/*.sh
/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

echo '[-] Accessing 127.0.0.1 for the first time'
# 奇怪的BUG，第一次必然卡住
curl 127.0.0.1 -m 1 &>/dev/null
curl -I 127.0.0.1

exec /etc/init.d/shell.sh /var/www/html
