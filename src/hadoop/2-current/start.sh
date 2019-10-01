#!/bin/bash

echo 'export JAVA_HOME=/jdk' >> /hadoop/etc/hadoop/hadoop-env.sh

/usr/sbin/sshd-keygen
/usr/sbin/sshd

su - hadoop -c "/bin/bash /tmp/hadoop.sh"
