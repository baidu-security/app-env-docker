#!/bin/bash

export JAVA_HOME=/jdk/

/etc/init.d/mysql.sh start
/etc/init.d/resin.sh start

exec /etc/init.d/shell.sh /resin/
