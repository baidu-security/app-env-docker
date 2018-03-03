FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/zzcms8.2.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o zzcms8.2.zip \
	&& unzip -q zzcms8.2.zip \
	&& mv zzcms8.2 "$install_path" \
	&& rm -f zzcms8.2.zip \
	&& touch "$install_path"/install/install.lock \
	&& chmod 777 -R "$install_path"

# 模拟安装步骤
COPY config.php "$install_path"/inc/config.php

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -xf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz

