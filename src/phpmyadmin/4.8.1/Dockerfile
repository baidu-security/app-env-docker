FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/phpMyAdmin-4.8.1-all-languages.tar.gz
ENV install_path /var/www/html

COPY install-package.tar.gz /tmp/

# 下载 
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& tar -zxf install-package.tar.gz -C "$install_path" \
	&& rm -f install-package.tar.gz \
	&& chown apache -R "$install_path" \
	&& chmod 777 -R "$install_path" \
	&& chmod 755 "$install_path"/config.inc.php

# 更新httpd启动脚本
COPY httpd.sh /etc/init.d/

RUN chmod +x /etc/init.d/*.sh
