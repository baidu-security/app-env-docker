FROM centos:centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN yum install -y epel-release yum-utils
RUN yum install -y httpd mysql-server mysql sendmail redis \
	wget curl zip unzip vim bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	python-pip gettext git file lftp psmisc \
	glibc.i686 gdb python2-crypto

# 安装数据库
RUN mysql_install_db \
	&& chown mysql -R /var/lib/mysql

# 其他配置
COPY *.sh .bash* .vimrc /root/
COPY server.cnf /etc/my.cnf.d/
RUN chmod 755 /etc/my.cnf.d/server.cnf
COPY httpd.conf /etc/httpd/conf/httpd.conf

# 启动脚本
COPY control/*.sh /etc/init.d/
RUN chmod +x /etc/init.d/*.sh

EXPOSE 80
