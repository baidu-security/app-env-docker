FROM openrasp/php:5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://github.com/typecho/typecho/releases/download/v1.1-15.5.12-beta/typecho.tar.gz
ENV install_path /var/www/html/

# 下载
RUN rm -rf "$install_path"
RUN wget $install_url -O /tmp/typecho.tar.gz

# 安装，生成假的配置文件
RUN tar -xf /tmp/typecho.tar.gz
RUN mv build "$install_path"
RUN touch "$install_path/config.inc.php"

