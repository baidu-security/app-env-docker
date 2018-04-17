#!/bin/bash

echo '[-] Starting Express server'
echo ' -  Logging to server.log'

cd /web/
nohup node server.js &> server.log &

exec /etc/init.d/shell.sh /web/
