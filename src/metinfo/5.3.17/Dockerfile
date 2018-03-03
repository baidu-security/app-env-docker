FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/metinfo-5.3.17.tar.gz
ENV install_path /var/www/html

# 下载
RUN curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& touch "$install_path"/config/install.lock \
	&& chmod 777 -R "$install_path" \
	&& echo 404 > "$install_path"/404.html

COPY .htaccess "$install_path"/

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

