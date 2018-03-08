FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

COPY start.sh /root/
COPY rsyncd.conf /etc/rsyncd.conf

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
