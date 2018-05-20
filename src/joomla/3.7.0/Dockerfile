FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/Joomla_3.7.0-Stable-Full_Package.tar.bz2
ENV install_path /var/www/html

# 下载
RUN curl "$install_url" -o /tmp/joomla.tar.bz2 \
	&& cd "$install_path" \
	&& tar -jxf /tmp/joomla.tar.bz2 \
	&& chmod 777 -R "$install_path" \
	&& rm -fr /tmp/joomla.tar.bz2 "$install_path"/installation/

# 模拟安装步骤
COPY configuration.php /var/www/html/configuration.php

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

