FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/Discuz_X3.2_SC_UTF8.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o dz.zip \
	&& unzip -q dz.zip \
	&& rm -f dz.zip \
	&& mv upload "$install_path" \
	&& touch "$install_path"/install.lock "$install_path"/uc_server/data/install.lock

# 配置
COPY all.patch /tmp
RUN cd /var/www/html \
	&& patch -p1 < /tmp/all.patch \
	&& chmod 777 -R "$install_path"

COPY mysql.tar.bz2 /tmp/
RUN tar xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2 \
	&& chown mysql -R /var/lib/mysql
