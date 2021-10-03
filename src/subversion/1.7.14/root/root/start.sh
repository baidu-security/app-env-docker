#!/bin/bash

echo '[-] Starting httpd daemon and svn module'
/etc/init.d/httpd.sh start

exec /etc/init.d/shell.sh /
