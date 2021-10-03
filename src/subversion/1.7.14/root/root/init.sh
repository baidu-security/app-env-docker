#!/bin/bash

rm -f /etc/httpd/conf.d/welcome.conf

mkdir -p /svn
svnadmin create /svn/repo1
chown -R apache:apache repo1

mkdir -p /etc/svn
echo 123456 | htpasswd -icm /etc/svn/svn-auth admin
echo 123456 | htpasswd -im /etc/svn/svn-auth user1
echo 123456 | htpasswd -im /etc/svn/svn-auth user2
chown root:apache /etc/svn/svn-auth
chmod 640 /etc/svn/svn-auth

cat > /svn/repo1/conf/authz << EOF
[groups]
admin=admin
repo1_user1=user1
repo1_user2=user2

[/]
@admin=rw

[repo1:/]
@repo1_user=rw
@repo1_user2=r
EOF
