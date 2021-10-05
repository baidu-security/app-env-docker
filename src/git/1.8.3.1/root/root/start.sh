#!/bin/bash

echo '[-] Configure svn repo'
rm -f /etc/httpd/conf.d/welcome.conf

# git
mkdir -p /root
git config --global user.email "commiter@github.com"
git config --global user.name "Anonymous User"
git config --global push.default simple

# repo
mkdir -p /var/www/html/git/test.git
cd /var/www/html/git/test.git
git --bare init
git update-server-info
chmod -R 777 .

# auth
echo 123456 | htpasswd -im /etc/git-htpasswd user1
echo 123456 | htpasswd -im /etc/git-htpasswd user2

nohup fcgiwrap -s unix:/var/run/fcgiwrap.socket &
sleep 1
chmod 777 /var/run/fcgiwrap.socket

# start service
/etc/init.d/nginx.sh start

echo '[-] Testing commit'
echo
git clone http://user1:123456@127.0.0.1/test.git my-repo
cd my-repo
echo 123 > test
git add test
git commit -a -m test
git push
echo

exec /etc/init.d/shell.sh /root
