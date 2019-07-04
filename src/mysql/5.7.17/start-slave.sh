#!/bin/bash

master_ip=$1

if [[ -z "$master_ip" ]]; then
    echo $0 master_ip
    exit
fi

export PATH=$PATH:/usr/local/mysql/bin

/usr/local/mysql/support-files/mysql.server stop
rm -f /data/mysql/auto.cnf
cp /etc/my-slave.cnf /etc/my.cnf
/usr/local/mysql/support-files/mysql.server start

cat >> /tmp/slave.sql << EOF
CHANGE MASTER TO MASTER_HOST='$master_ip',MASTER_USER='slave_user', MASTER_PASSWORD='slave_pass', MASTER_LOG_FILE='master.000002', MASTER_LOG_POS=1460;
START SLAVE;
EOF

mysql -uroot < /tmp/slave.sql
mysql -uroot -e 'SHOW SLAVE STATUS\G'

