FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y openssh-server \
	&& rpm -ivh https://packages.baidu.com/app/rssh-2.3.4-6.el7.centos.opsec.x86_64.rpm

COPY rssh.conf /etc/
COPY *.sh /root/

RUN chmod +x /root/*.sh
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
