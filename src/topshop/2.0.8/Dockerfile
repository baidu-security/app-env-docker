FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  http://www.zzcms.net/download/zzcms8.2.zip
ENV install_url  https://packages.baidu.com/app/TPshop_20171106_v2.0.8.tar.gz
ENV install_path /var/www/html

# 下载
RUN wget $install_url -O /tmp/tpshop.tar.gz
RUN rm -rf "$install_path" \
	&& tar -zxf /tmp/tpshop.tar.gz \
	&& mv TPshop_20171106_v2.0.8/ "$install_path" \
	&& touch "$install_path"/install/install.lock \
	&& chmod 777 -R "$install_path" \
	&& rm -fr /tmp/tpshop.tar.gz

# 模拟安装步骤
COPY database.php "$install_path"/application/database.php
COPY constant.php "$install_path"/application/admin/conf/constant.php

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -xf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz

