#!/bin/bash

echo '[-] Configure svn repo'
rm -f /etc/httpd/conf.d/welcome.conf

# repo
mkdir -p /svn
svnadmin create /svn/repo1
chown -R apache:apache /svn/repo1

# auth
mkdir -p /etc/svn
echo 123456 | htpasswd -icm /etc/svn/svn-auth admin
echo 123456 | htpasswd -im /etc/svn/svn-auth user1
echo 123456 | htpasswd -im /etc/svn/svn-auth user2

cat > /etc/svn/authz << EOF
[groups]
admin=admin
repo1_user1=user1
repo1_user2=user2

[/]
@admin=rw

[repo1:/]
@repo1_user1=rw
@repo1_user2=r
EOF

chown root:apache /etc/svn/*
chmod 640 /etc/svn/*

# start service
/etc/init.d/httpd.sh start

echo '[-] Testing access'
curl http://user1:123456@127.0.0.1/svn/repo1/

exec /etc/init.d/shell.sh /
