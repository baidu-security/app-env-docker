FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/thinkphp-5.0.15.zip
ENV install_path /var/www/html

# 下载
RUN cd "$install_path" \
	&& curl "$install_url" -o package.zip \
	&& unzip -q package.zip \
	&& rm -f package.zip \
	&& chmod 777 -R "$install_path"

COPY php/Index.php "$install_path"/application/index/controller/Index.php

COPY php/config.php "$install_path"/application/
COPY php/database.php "$install_path"/application/

COPY index.php "$install_path"/
COPY start.sh /root/
