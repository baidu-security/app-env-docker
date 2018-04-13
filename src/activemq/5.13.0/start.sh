#!/bin/bash

/etc/init.d/activemq.sh start

exec /etc/init.d/shell.sh "/"
