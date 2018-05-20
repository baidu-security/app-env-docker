FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/CodeIgniter-2.1.4.zip
ENV install_path /var/www/html

# 下载
RUN curl "$install_url" -o package.zip \
	&& unzip -o -q package.zip \
	&& mv CodeIgniter-2.1.4/* "$install_path/" \
	&& rm -f package.zip

COPY news.php "$install_path"/application/controllers/
COPY config.php "$install_path"/application/config/
COPY .htaccess "$install_path"/
