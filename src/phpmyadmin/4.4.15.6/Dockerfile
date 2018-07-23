FROM openrasp/php5.3

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/phpmyadmin-RELEASE_4_4_15_6.tar.gz
ENV install_path /var/www/html

COPY install-package.tar.gz /tmp/
COPY database.sql /root/

# 更新mysql

RUN yum remove -y mysql \
	&& rm -rf /etc/my.cnf /etc/my.cnf.d/ /var/lib/mysql
	
RUN yum install -y http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm \
	&& yum install -y mysql-community-server \
	&& mysql_install_db --user=mysql --explicit_defaults_for_timestamp

COPY mysql-5.6/my.cnf /etc/my.cnf
RUN chmod 755 /etc/my.cnf

# 下载 
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& tar -zxf install-package.tar.gz -C "$install_path" \
	&& rm -f install-package.tar.gz \
	&& chown apache -R "$install_path" \
	&& chmod 777 -R "$install_path" \
	&& chmod 755 "$install_path"/config.inc.php


# 更新启动脚本
COPY start.sh /root/

# 更新httpd启动脚本
COPY httpd.sh /etc/init.d/
