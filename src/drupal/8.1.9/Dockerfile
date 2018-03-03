FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/drupal-8.1.9.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& mv drupal-8.1.9 "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path"

# 配置
COPY site.tar.gz /tmp/
RUN tar xf /tmp/site.tar.gz -C "$install_path"

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

