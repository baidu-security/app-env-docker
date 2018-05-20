#!/bin/bash

/etc/init.d/mysql.sh start

echo '[-] Starting Express server'
echo ' -  Logging to server.log'
cd /tmp/express-4.13.1/examples/static-files/
nohup node index.js &> server.log &

exec /etc/init.d/shell.sh /
