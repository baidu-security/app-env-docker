FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://rasp.baidu.com/download/libv8-5.9-linux.tar.gz -P /tmp/libv8-5.9-linux.tar.gz

RUN yum install -y centos-release-scl \
	&& yum install -y devtoolset-3-gcc-c++ php-devel

COPY *.sh /root/
