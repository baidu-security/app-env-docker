#!/bin/bash

/etc/init.d/mysql.sh start
exec /etc/init.d/shell.sh /tmp
