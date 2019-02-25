#!/bin/bash

/etc/init.d/mysql.sh start

mysql -uroot -e 'create database if not exists test;'
mysql -uroot -e 'create table test.loot(line TEXT);'
mysql -uroot -e 'grant all privileges on mysql.* to test@localhost identified by "test";'
mysql -uroot -e 'grant all privileges on test.* to test@localhost identified by "test";'

/usr/bin/maxscale
maxadmin -u admin -p mariadb show filters

mysql -utest -ptest --port 4008 -e 'select @@version_comment'
mysql -utest -ptest --port 3306 -e 'select * from test.loot'

/etc/init.d/shell.sh /root/
