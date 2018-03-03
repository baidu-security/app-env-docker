FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://rpms.remirepo.net/enterprise/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

# RUN yum clean all && yum update

RUN yum install -y php55 php55-php php55-php-fpm php55-php-cli \
	php55-php-mysqlnd php55-php-gd php55-php-soap php55-php-bcmath \
	php55-php-mcrypt php55-php-mbstring php55-php-xml php55-php-pecl-yaml \
	php55-php-ioncube-loader

RUN ln -s /opt/remi/php55/root/bin/php /usr/bin

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
