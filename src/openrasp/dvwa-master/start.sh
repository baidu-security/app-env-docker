#!/bin/bash

chmod -R +x /etc/init.d/*.sh
/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

exec /etc/init.d/shell.sh /var/www/html
