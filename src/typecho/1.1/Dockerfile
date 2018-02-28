FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  https://github.com/typecho/typecho/releases/download/v1.1-15.5.12-beta/typecho.tar.gz
ENV install_url  https://packages.baidu.com/app/typecho-v1.1-15.5.12-beta.tar.gz
ENV install_path /var/www/html/

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o /tmp/typecho.tar.gz \
	&& tar -xf /tmp/typecho.tar.gz \
	&& mv build "$install_path" \
	&& touch "$install_path/config.inc.php" \
	&& rm -f /tmp/typecho.tar.gz

# 配置
COPY config.inc.php "$install_path"/config.inc.php
COPY mysql.tar.gz /tmp/mysql.tar.gz

RUN tar xf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz


