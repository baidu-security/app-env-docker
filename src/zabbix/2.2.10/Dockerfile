FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/zabbix-2.2.10.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& mv zabbix-2.2.10/frontends/php/ "$install_path" \
	&& rm -f package.tar.gz

COPY zabbix.conf.php "$install_path"/conf/zabbix.conf.php

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

