FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  http://www.zzcms.net/download/zzcms8.2.zip
ENV install_url  https://packages.baidu.com/app/seacms-6.45.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path"
RUN curl "$install_url" -o seacms-6.45.tar.gz \
	&& tar -xf seacms-6.45.tar.gz \
	&& mv seacms_6.45 "$install_path" \
	&& rm -f seacms-6.45.tar.gz

# 模拟安装步骤
COPY common.inc.php /var/www/html/data/
RUN touch "$install_path"/install/install.lock \
	&& chmod 777 -R "$install_path"

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -xf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz

