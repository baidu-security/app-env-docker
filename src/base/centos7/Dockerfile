FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN yum install -y epel-release
RUN yum install -y httpd sendmail redis \
	wget curl zip unzip vim bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	python-pip gettext git file lftp jq psmisc \
	glibc.i686 gdb python2-crypto

# 安装 MySQL 5.6
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm \
	&& yum install -y mysql-community-server

# 初始化数据库
RUN mysql_install_db --user=mysql --explicit_defaults_for_timestamp

# 其他配置
COPY *.sh .bash* .vimrc /root/
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY server.cnf /etc/my.cnf.d/

EXPOSE 80
