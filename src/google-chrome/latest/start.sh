#!/bin/bash

echo '[-] Starting Google Chrome in background'
echo '    - Loggin to /google-chrome.log'

nohup xvfb-run --server-args='-screen 0, 1024x768x16' google-chrome --headless --disable-gpu -remote-debugging-port=9222 -remote-debugging-address=0.0.0.0 --disable-xss-auditor --no-sandbox &> /google-chrome.log &

/etc/init.d/shell.sh /
