#!/bin/bash

chmod -R +x /etc/init.d/*.sh
/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

echo '[-] Adding database test'
cat > /tmp/test.sql << EOF
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
grant all privileges on test.* to 'test'@'%' identified by 'test';
grant all privileges on test.* to 'test'@'localhost' identified by 'test';
CREATE TABLE test.user (id int, username text);
INSERT INTO test.user values (1, "a")
EOF

mysql -uroot < /tmp/test.sql
rm -f /tmp/test.sql

exec /etc/init.d/shell.sh /var/www/html
