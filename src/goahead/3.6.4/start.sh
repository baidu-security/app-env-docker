#!/bin/bash

cd /goahead 

echo '[-] Starting GoAhead server'
echo ' -  Logging to /goahead/server.log'
./goahead &> server.log &

exec /etc/init.d/shell.sh /goahead
