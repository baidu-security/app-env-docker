FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/cmseasy_5.6_20160825.tar.gz
ENV install_path /var/www/html

# 下载
COPY install-package.tar.gz /tmp/
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path" \
	&& tar -zxf install-package.tar.gz -C "$install_path" \
	&& rm -f install-package.tar.gz

# 配置
COPY change-config.sh "$install_path"
RUN cd "$install_path" \
	&& chmod +x change-config.sh \
	&& ./change-config.sh \
	&& rm -f change-config.sh

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -zxf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz
