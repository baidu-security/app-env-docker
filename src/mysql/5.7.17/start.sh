#!/bin/bash

export PATH=$PATH:/usr/local/mysql/bin

/usr/local/mysql/support-files/mysql.server start

mysql -uroot -e "CREATE USER 'root'@'%' IDENTIFIED BY ''; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
exec /etc/init.d/shell.sh /root/
