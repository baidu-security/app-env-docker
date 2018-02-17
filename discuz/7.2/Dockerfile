FROM openrasp/php:latest

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  http://download.comsenz.com/Discuz/7.2/Discuz_7.2_FULL_SC_UTF8.zip
ENV install_path /var/www/html/

# 下载
RUN rm -rf "$install_path"
RUN wget $install_url -O dz72.zip

RUN unzip dz72.zip
RUN mv upload "$install_path"

