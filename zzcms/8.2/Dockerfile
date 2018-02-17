FROM openrasp/php:latest

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  http://www.zzcms.net/download/zzcms8.2.zip
ENV install_path /var/www/html/

# 下载
RUN rm -rf "$install_path"
RUN wget $install_url -O zzcms8.2.zip

# 解压缩
RUN unzip zzcms8.2.zip
RUN mv zzcms8.2 "$install_path"

# 模拟安装步骤
COPY config.php /var/www/html/inc/config.php
RUN touch /var/www/html/install/install.lock
RUN chmod 777 -R /var/www/html

# 安装数据库
COPY zzcms-mysqldb.tar.gz /tmp/
RUN tar -xf /tmp/zzcms-mysqldb.tar.gz -C /var/lib/mysql
RUN chown mysql -R /var/lib/mysql

