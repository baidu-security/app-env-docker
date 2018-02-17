FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  http://www.zzcms.net/download/zzcms8.2.zip
ENV install_url  https://downloads.joomla.org/cms/joomla3/3-8-3/Joomla_3-8-3-Stable-Full_Package.tar.bz2?format=bz2
ENV install_path /var/www/html/

# 下载
RUN wget $install_url -O /tmp/joomla.tar.bz2
RUN cd /var/www/html \
	&& tar -jxf /tmp/joomla.tar.bz2 \
	&& chmod 777 -R /var/www/html \
	&& rm -fr /tmp/joomla.tar.bz2 /var/www/html/installation/

# 模拟安装步骤
COPY configuration.php /var/www/html/configuration.php

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

