#!/bin/bash

/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

mysql -uroot -e 'create database if not exists xvwa'

exec /etc/init.d/shell.sh /var/www/html
