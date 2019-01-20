#!/bin/bash

useradd test -G rsshusers -m -s /usr/bin/rssh
echo test | passwd test --stdin

/usr/sbin/sshd-keygen
/usr/sbin/sshd

/etc/init.d/shell.sh /root
