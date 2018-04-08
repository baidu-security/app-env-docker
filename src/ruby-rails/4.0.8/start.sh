#!/bin/bash

echo '[-] Loading RVM'
source /etc/profile.d/rvm.sh

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

echo '[-] To start CVE-2016-0752 rails server do'
echo '    - cd /rails-rce-cve-2016-0752 && rails server -p 80'

cd /
/bin/bash
