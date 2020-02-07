#!/bin/bash

version=${1:-latest}
shift

echo '[-] Download and install rasp-java'
rm -rf /tmp/rasp-*
curl "https://packages.baidu.com/app/openrasp/release/${version}/rasp-java.tar.gz" -o - | tar -xzf - -C /tmp

cd /tmp/rasp-*
/jdk/bin/java -jar /tmp/rasp-*/RaspInstall.jar -install /tomcat/ "$@"

curl https://packages.baidu.com/app/openrasp/999-event-logger.js -o /tomcat/rasp/plugins/999-event-logger.js

if pidof java 1>/dev/null; then
	/etc/init.d/tomcat.sh stop
	/etc/init.d/tomcat.sh start
fi

