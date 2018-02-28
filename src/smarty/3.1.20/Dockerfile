FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_path /var/www/html

RUN cd "$install_path" \
	&& composer require smarty/smarty:3.1.20

COPY index.php "$install_path"/