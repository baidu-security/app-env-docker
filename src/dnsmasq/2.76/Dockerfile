FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y dnsmasq
COPY localhost.conf /etc/dnsmasq.d/

COPY *.sh /root/
RUN chmod +x /root/*.sh

EXPOSE 53
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
