FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN yum clean all
RUN yum install -y epel-release
RUN yum install -y httpd nginx sendmail redis \
	wget curl zip unzip vim bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	python-pip gettext git file lftp jq psmisc \
	glibc.i686 gdb python2-crypto inotify-tools

# 安装 mariadb 5.5
RUN yum install -y mariadb-server mariadb \
	&& mysql_install_db --user=mysql

# 其他配置
COPY *.sh .bash* .vimrc /root/
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY server.cnf /etc/my.cnf.d/
RUN chmod 755 /etc/my.cnf.d/server.cnf

# 启动脚本
COPY control/*.sh /etc/init.d/
RUN chmod +x /etc/init.d/*.sh

# 统一修改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 80
