FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  http://download.comsenz.com/Discuz/7.2/Discuz_7.2_FULL_SC_UTF8.zip
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o dz.zip \
	&& unzip -q dz.zip \
	&& rm -f dz.zip \
	&& mv upload "$install_path" \
	&& touch "$install_path"/forumdata/install.lock \
	&& chmod 777 -R "$install_path"

# 配置
COPY config.inc.php "$install_path"

COPY mysql.tar.gz /tmp/
RUN tar xf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz \
	&& chown mysql -R /var/lib/mysql
