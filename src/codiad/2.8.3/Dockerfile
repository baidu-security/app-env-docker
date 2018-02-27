FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  http://www.zzcms.net/download/zzcms8.2.zip
ENV install_url  https://packages.baidu.com/app/Codiad-v.2.8.3.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& mv Codiad-v.2.8.3 "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path" \
	&& mkdir -p /tmp/demo

COPY data/* "$install_path"/data/
COPY config.php "$install_path"