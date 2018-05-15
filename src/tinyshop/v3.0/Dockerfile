FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/xxx.tar.gz
ENV install_path /var/www

# 下载
COPY tinyshop-v3.0.tar.gz /tmp/package.tar.gz
# curl "$install_url" -o package.tar.gz \
RUN cd /tmp \
	&& tar xf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path"


# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -xf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz
