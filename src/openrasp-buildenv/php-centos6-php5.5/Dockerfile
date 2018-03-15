FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装 REMI 仓库
RUN curl http://rpms.famillecollet.com/enterprise/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm \
	&& yum install -y centos-release-scl \
	&& yum install -y devtoolset-3-gcc-c++ make

# 下载 v8
RUN curl https://rasp.baidu.com/download/libv8-5.9-linux.tar.gz -o /tmp/libv8-5.9-linux.tar.gz \
	&& tar -xf /tmp/libv8-5.9-linux.tar.gz -C /	

# 安装指定版本的 PHP
RUN yum-config-manager --enable remi-php55 \
	&& yum install -y php php-curl php-soap php-gd php-xml php-mysql php-mbstring php-pdo php-json php-devel

COPY *.sh /root/
RUN chmod +x /root/*.sh
