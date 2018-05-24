#!/bin/bash

export JAVA_HOME=/jdk/

/etc/init.d/mysql.sh start
/etc/init.d/jboss7.sh start

exec /etc/init.d/shell.sh /jboss
