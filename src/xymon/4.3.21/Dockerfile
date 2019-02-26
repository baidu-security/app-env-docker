FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

COPY *.repo /etc/yum.repos.d
COPY *.sh /root/

RUN yum install xymon-4.3.21-4.el7 xymon-client-4.3.21-4.el7 -y

RUN chmod +x /root/*.sh
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
