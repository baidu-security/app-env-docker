#!/bin/bash

/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

exec /etc/init.d/shell.sh /var/www/html
