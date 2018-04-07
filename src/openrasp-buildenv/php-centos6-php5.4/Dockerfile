FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装 REMI 仓库
RUN curl http://rpms.famillecollet.com/enterprise/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm \
	&& yum install -y centos-release-scl \
	&& yum install -y devtoolset-4-gcc-c++ make cmake libuuid-devel re2c libxml2-devel zlib-devel

# 安装指定版本的 PHP
RUN yum-config-manager --enable remi-php54 \
	&& yum install -y php php-curl php-soap php-gd php-xml php-mysql php-mbstring php-pdo php-json php-devel

COPY *.sh /root/
RUN chmod +x /root/*.sh
