#!/bin/bash

/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

echo '[-] Adding MySQL user test@localhost'
cat > /tmp/test.sql << EOF
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
grant all privileges on test.* to 'test'@'%' identified by 'test';
grant all privileges on test.* to 'test'@'localhost' identified by 'test';
CREATE TABLE test.vuln (id INT, name text);
INSERT INTO test.vuln values (0, "openrasp");
INSERT INTO test.vuln values (1, "rocks");
EOF

mysql -uroot < /tmp/test.sql
rm -f /tmp/test.sql

exec /etc/init.d/shell.sh /var/www/html
