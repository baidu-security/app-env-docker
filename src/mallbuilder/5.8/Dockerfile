FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/MallBuilder_a5.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.zip \
	&& unzip -o -q package.zip \
	&& rm -f package.zip \
	&& mv mallbuilderv5.8 "$install_path" \
	&& touch "$install_path"/install/install.lock \
	&& chmod 777 -R "$install_path"

COPY config/* "$install_path"/config/

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

