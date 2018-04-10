FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_path /var/www/html

# 下载
RUN mkdir -p "$install_path" \
	&& cd "$install_path" \
	&& composer require phpmailer/phpmailer:5.2.17

COPY index.php "$install_path"/

