FROM openrasp/static-tools

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/goahead-3.6.4-bin.tar.bz2

# 下载
RUN curl "$install_url" -o package.tar.bz2 \
	&& tar xf package.tar.bz2 -C / 

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80 443
