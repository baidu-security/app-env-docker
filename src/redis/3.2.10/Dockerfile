FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

COPY *.sh /root/
RUN yum -y install redis \
	&& chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
