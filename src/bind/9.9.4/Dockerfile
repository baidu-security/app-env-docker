FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y bind

COPY etc/* /etc/
COPY start.sh /root/

EXPOSE 53
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
