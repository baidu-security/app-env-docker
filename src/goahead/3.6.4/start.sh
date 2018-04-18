#!/bin/bash

cd /goahead 

echo '[-] Starting GoAhead server'
echo ' -  Loggint to /goahead/server.log'
./goahead &> server.log &

exec /etc/init.d/shell.sh /goahead
