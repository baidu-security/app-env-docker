FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN rpm -ivh https://packages.baidu.com/app/maxscale-1.4.1-1.centos_7.x86_64.rpm

COPY maxscale.cnf /etc/
COPY *.sh /root/
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
