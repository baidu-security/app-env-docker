#!/bin/bash

/etc/init.d/mysql.sh start

echo '[-] Adding MySQL user rasp@localhost'
cat > /tmp/test.sql << EOF
DROP DATABASE IF EXISTS openrasp;
CREATE DATABASE openrasp default charset utf8 COLLATE utf8_unicode_ci;
grant all privileges on openrasp.* to 'rasp'@'%' identified by 'rasp123';
grant all privileges on openrasp.* to 'rasp'@'localhost' identified by 'rasp123';
EOF

mysql -uroot < /tmp/test.sql
rm -f /tmp/test.sql

echo '[-] Installing OpenRASP-IAST'
pip3 install --upgrade git+https://github.com/baidu-security/openrasp-iast

exec /etc/init.d/shell.sh /root
