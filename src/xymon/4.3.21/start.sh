#!/bin/bash

nohup xymond --debug &> /var/log/xymond.log &
/etc/init.d/shell.sh /root/
