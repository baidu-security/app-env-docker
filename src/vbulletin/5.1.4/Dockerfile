FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/vBulletin_5.1.4.tar.gz
ENV install_path /var/www/html

# 下载
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& mv "$install_path"/core/install "$install_path"/core/install.bak \
	&& chmod 777 -R "$install_path"

COPY config.php "$install_path"/core/includes/config.php

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -zxf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz
