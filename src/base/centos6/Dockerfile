FROM centos:centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN rm -rf /etc/yum.repos.d/*
COPY root /root
COPY etc /etc
RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6

RUN yum clean all
RUN yum install -y yum-utils
RUN yum install -y httpd mysql-server mysql sendmail redis \
	wget curl zip unzip vim bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	python-pip gettext git file lftp psmisc xz \
	glibc.i686 gdb python2-crypto inotify-tools libxml2-devel

# 安装数据库
RUN mysql_install_db \
	&& chown mysql -R /var/lib/mysql

# 其他配置
RUN chmod 755 /etc/my.cnf.d/server.cnf

# 启动脚本
RUN chmod +x /etc/init.d/*.sh

# 统一修改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 80
