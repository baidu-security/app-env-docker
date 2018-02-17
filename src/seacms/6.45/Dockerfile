FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  http://www.zzcms.net/download/zzcms8.2.zip
ENV install_url  https://packages.baidu.com/app/seacms-6.45.tar.gz
ENV install_path /var/www/html/

# 下载
RUN rm -rf "$install_path"
RUN wget $install_url -O seacms-6.45.tar.gz \
	&& tar -xf seacms-6.45.tar.gz \
	&& mv seacms_6.45 "$install_path"

# 模拟安装步骤
COPY common.inc.php /var/www/html/data/
RUN touch /var/www/html/install/install.lock \
	&& chmod 777 -R /var/www/html

# 安装数据库
COPY seacms-mysqldb.tar.gz /tmp/
RUN tar -xf /tmp/seacms-mysqldb.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql

