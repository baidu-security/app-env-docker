FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - \
	&& curl -sSL https://get.rvm.io | bash -s stable

COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80 3000
