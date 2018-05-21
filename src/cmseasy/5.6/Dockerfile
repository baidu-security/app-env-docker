FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/cmseasy_5.6_20160825.tar.gz
ENV install_path /var/www/html

# 下载
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& touch "$install_path"/install/locked \
	&& chmod 777 -R "$install_path"

# 配置
COPY copy/config.inc.php "$install_path"/celive/include/config.inc.php
COPY copy/config.php "$install_path"/config/config.php

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -zxf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz
