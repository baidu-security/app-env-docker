#!/bin/bash
  
/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start
  
echo '[-] Importing sql file'
mysql < /root/database.sql
rm /root/database.sql
  
echo '[-] Accessing 127.0.0.1 for the first time'
curl 127.0.0.1 &>/dev/null
  
exec /etc/init.d/shell.sh /var/www/html			