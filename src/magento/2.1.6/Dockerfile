FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/magento2-2.1.6.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv magento2* "$install_path"

RUN cd "$install_path" \
	&& composer install

COPY patch-all.tar.bz2 /tmp/patch.tar.bz2
RUN tar -xf /tmp/patch.tar.bz2 -C / \
	&& rm -f /tmp/patch.tar.bz2 \
	&& chmod 777 -R "$install_path"

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

