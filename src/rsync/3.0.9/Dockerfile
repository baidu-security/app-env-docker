FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

COPY start.sh /root/
COPY rsyncd.conf /etc/rsyncd.conf

EXPOSE 873
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
