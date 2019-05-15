#!/bin/bash

export PATH=$PATH:/usr/local/mysql/bin

echo '[-] Starting MySQL server'
/usr/local/mysql/support-files/mysql.server start

cat > /tmp/start.sql << EOF
CREATE USER 'root'@'%' IDENTIFIED BY ''; 
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%' IDENTIFIED BY 'slave_pass';

CREATE DATABASE IF NOT EXISTS test;
CREATE TABLE test.user (id INT, name TEXT);
INSERT INTO test.user VALUES (1, "abc");
EOF

mysql -uroot < /tmp/start.sql
rm -f /tmp/start.sql

mysql -uroot -e 'show master status'

exec /etc/init.d/shell.sh /root/

