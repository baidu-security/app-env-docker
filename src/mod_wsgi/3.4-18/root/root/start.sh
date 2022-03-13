#!/bin/bash

chmod 777 /echo.py
sed '/Require all denied/d' -i /etc/httpd/conf/httpd.conf
/etc/init.d/httpd.sh start

curl 127.0.0.1/echo -d echo=test
exec /etc/init.d/shell.sh /var/www/html
