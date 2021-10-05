FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install git fcgiwrap -y

COPY /root /

EXPOSE 80
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
