FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN rpm -ivh https://packages.baidu.com/app/google-authenticator-1.04-1.el7.x86_64.rpm
RUN yum install -y openssh-server oathtool

COPY etc /etc
COPY root /root

RUN chmod +x /root/*.sh \
	&& chmod 600 /root/.google_authenticator

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
