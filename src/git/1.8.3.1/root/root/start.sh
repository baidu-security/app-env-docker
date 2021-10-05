#!/bin/bash

echo '[-] Configure svn repo'
rm -f /etc/httpd/conf.d/welcome.conf

# repo
mkdir -p /var/www/html/git/test.git
cd /var/www/html/git/test.git
git --bare init
git update-server-info
chown -R www-data.www-data .
chmod -R 755 .

# auth
echo 123456 | htpasswd -icm /etc/git-htpasswd admin
echo 123456 | htpasswd -im /etc/git-htpasswd user1
echo 123456 | htpasswd -im /etc/git-htpasswd user2

nohup fcgiwrap -s unix:/var/run/fcgiwrap.socket &
chmod 777 /var/run/fcgiwrap.socket

# start service
/etc/init.d/nginx.sh start

echo '[-] Testing access'
curl http://user1:123456@127.0.0.1/git/test.git/config; echo

exec /etc/init.d/shell.sh /
