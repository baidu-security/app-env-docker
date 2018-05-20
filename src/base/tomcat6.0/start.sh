#!/bin/bash

export JAVA_HOME=/jdk/

/etc/init.d/tomcat.sh start

/etc/init.d/mysql.sh start

exec /etc/init.d/shell.sh /tomcat/

