#!/bin/bash

mysql_add_userAndDB ()
{
    if [[ -z "$1" ]]; then
        return;
    fi;
    name="$1";
    set -x;
    mysql -uroot -e "drop database if exists $name;";
    mysql -uroot -e "create database $name;";
    mysql -uroot -e "grant all privileges on $name.* to $name@'%' identified by '$name';";
    mysql -uroot -e "grant all privileges on $name.* to $name@localhost identified by '$name';";
    mysql -uroot -e "flush privileges;";
    set -
}

for x in "$@"
do
    mysql_add_userAndDB "$x"
done

