FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://rpms.remirepo.net/enterprise/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

RUN yum install -y php56 php56-fpm php56-php php56-php-fpm php56-php-cli \
	php56-php-mysqlnd php56-php-gd php56-php-soap php56-php-bcmath \
	php56-php-mcrypt php56-php-mbstring php56-php-xml php56-php-pecl-yaml \
	php56-php-ioncube-loader php56-php-pecl-xdebug php56-php-intl php56-php-pecl-redis

RUN ln -s /opt/remi/php56/root/bin/php /usr/bin
COPY php.ini /opt/remi/php56/root/etc/php.ini

# 替换 mariadb 5.5 为最新的 MySQL 5.6
RUN yum remove -y mariadb mariadb-server \
	&& rm -rf /etc/my.cnf /etc/my.cnf.d/ /var/lib/mysql

RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm \
	&& yum install -y mysql-community-server \
	&& mysql_install_db --user=mysql --explicit_defaults_for_timestamp

COPY mysql-5.6/my.cnf /etc/my.cnf
RUN chmod 755 /etc/my.cnf

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
