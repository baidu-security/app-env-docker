FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/DedeCMS-V5.7-UTF8-SP2-20180109.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& mv DedeCMS-V5.7-UTF8-SP2/uploads "$install_path" \
	&& touch "$install_path"/install/install_lock.txt \
	&& chmod 777 -R "$install_path" \
	&& rm -rf DedeCMS-V5.7-UTF8-SP2

COPY common.inc.php config.cache.inc.php "$install_path"/data/

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

