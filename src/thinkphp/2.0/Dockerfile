FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/thinkphp-2.0.tar.gz
ENV install_path /var/www/html

# 下载
RUN curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path"


