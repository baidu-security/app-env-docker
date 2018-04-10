FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/phpMyAdmin-3.5.6-all-languages.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.zip \
	&& unzip -o -q package.zip \
	&& mv phpMyAdmin-3.5.6-all-languages "$install_path"

COPY config.inc.php "$install_path"


