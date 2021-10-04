#!/bin/bash

/etc/init.d/tomcat.sh start
/etc/init.d/mysql.sh start
apachectl -k start

mkdir -p /tomcat/webapps/test
echo 123 > /tomcat/webapps/test/index.jsp

exec /etc/init.d/shell.sh /tomcat/
