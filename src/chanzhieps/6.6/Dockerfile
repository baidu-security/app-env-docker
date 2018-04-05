FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/chanzhiEPS.6.6.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.zip \
	&& unzip package.zip \
	&& rm -f package.zip \
	&& mv chanzhieps "$install_path"

COPY index.html "$install_path"
COPY my.php "$install_path"/system/config/my.php

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

