FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y centos-release-scl \
	&& yum install -y devtoolset-4-gcc-c++ cmake libuuid-devel

RUN yum install -y php-devel make php php-curl php-xml php-mysql php-pdo php-json

COPY *.sh /root/
RUN chmod +x /root/*.sh
