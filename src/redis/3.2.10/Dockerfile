FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

COPY *.sh /root/
RUN chmod +x /root/*.sh

EXPOSE 6379
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
