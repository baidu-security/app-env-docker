#!/bin/bash

echo '[-] Starting rsync daemon'
rsync --daemon

exec /etc/init.d/shell.sh /

