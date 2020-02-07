#!/bin/bash

export JAVA_HOME=/jdk/

/root/version.sh
/etc/init.d/tomcat.sh start
/etc/init.d/mysql.sh start

exec /etc/init.d/shell.sh /tomcat/
