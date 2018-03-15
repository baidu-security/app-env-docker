FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y centos-release-scl \
	&& yum install -y devtoolset-3-gcc-c++ php-devel make php php-curl php-xml php-mysql php-pdo php-json

RUN curl https://rasp.baidu.com/download/libv8-5.9-linux.tar.gz -o /tmp/libv8-5.9-linux.tar.gz \
	&& tar -xf /tmp/libv8-5.9-linux.tar.gz -C /

COPY *.sh /root/
RUN chmod +x /root/*.sh
