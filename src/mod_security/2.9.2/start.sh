#!/bin/bash

chmod -R +x /etc/init.d/*.sh
/etc/init.d/httpd.sh start

curl -I 127.0.0.1/?a=../../../../../../../../etc/passwd

exec /etc/init.d/shell.sh /var/www/html
