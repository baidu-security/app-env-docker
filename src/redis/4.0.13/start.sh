#!/bin/bash

/etc/init.d/redis.sh start
exec /etc/init.d/shell.sh /root/
