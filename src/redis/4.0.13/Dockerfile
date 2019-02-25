FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN rpm -e redis \
	&& rpm -ivh https://packages.baidu.com/app/redis40u-4.0.13-1.ius.centos7.x86_64.rpm

COPY *.sh /root/
RUN chmod +x /root/*.sh

EXPOSE 6379
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
