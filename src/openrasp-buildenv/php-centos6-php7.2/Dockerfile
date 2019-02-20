FROM openrasp/devtoolset-4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV php_remi_ver 72

# 安装指定版本的 PHP
RUN yum-config-manager --enable remi-php"$php_remi_ver" \
	&& yum install -y php php-curl php-soap php-gd php-xml php-mysql php-mbstring php-pdo php-json php-devel

