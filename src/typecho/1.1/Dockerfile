FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# ENV install_url  https://github.com/typecho/typecho/releases/download/v1.1-15.5.12-beta/typecho.tar.gz
ENV install_url  https://packages.baidu.com/app/typecho-v1.1-15.5.12-beta.tar.gz
ENV install_path /var/www/html/

# 下载
RUN rm -rf "$install_path" \
	&& wget $install_url -O /tmp/typecho.tar.gz \
	&& tar -xf /tmp/typecho.tar.gz \
	&& mv build "$install_path" \
	&& touch "$install_path/config.inc.php" \
	&& rm -f /tmp/typecho.tar.gz

# 没做配置 - 只是测试反序列化漏洞，无需数据库

