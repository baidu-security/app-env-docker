FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/mongodb-linux-x86_64-rhel70-3.6.3.tgz
ENV install_path /var/www/html

# 下载
RUN curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv mongodb-linux-x86_64-rhel70-3.6.3 /mongodb \
	&& mkdir -p /mongodb/data \
	&& chmod 777 -R /mongodb

COPY start.sh /root/

EXPOSE 27017
ENTRYPOINT ["/bin/bash", "/root/start.sh"]