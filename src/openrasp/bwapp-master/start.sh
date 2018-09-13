#!/bin/bash

chmod -R +x /etc/init.d/*.sh
/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

curl 'http://127.0.0.1/bWAPP/install.php?install=yes' &>/dev/null
exec /etc/init.d/shell.sh /var/www/html

