#!/bin/bash

cat >> /hadoop/etc/hadoop/hadoop-env.sh << 'EOF'
export JAVA_HOME=/jdk
EOF

/usr/sbin/sshd-keygen
/usr/sbin/sshd

su - hadoop -c "/bin/bash /tmp/hadoop.sh"
