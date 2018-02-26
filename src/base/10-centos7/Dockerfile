FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN yum install -y httpd mariadb-server mariadb \
	php php-curl php-soap php-gd php-xml php-mysql php-pecl-yaml php-mbstring \
	wget curl unzip vim bzip2 net-tools iproute lrzsz nc

# 安装数据库
RUN mysql_install_db \
	&& chown mysql -R /var/lib/mysql

# 其他配置
COPY *.sh .bash* .vimrc /root/
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY server.cnf /etc/my.cnf.d/