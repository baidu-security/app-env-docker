#!/bin/bash

export PATH=$PATH:/usr/local/mysql/bin

/usr/local/mysql/support-files/mysql.server start

exec /etc/init.d/shell.sh /root/