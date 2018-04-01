FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装 splunk
RUN cd / \
	&& curl "https://packages.baidu.com/app/splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz" -o splunk.tar.gz \
	&& tar -xf splunk.tar.gz \
	&& rm -f splunk.tar.gz

# 解决文件系统报错问题
RUN echo >> /splunk/etc/splunk-launch.conf \
	&& echo OPTIMISTIC_ABOUT_FILE_LOCKING=1 >> /splunk/etc/splunk-launch.conf

# 下载 OpenRASP Splunk 扩展
ADD https://rasp.baidu.com/download/splunk-app-1.0.zip /tmp/splunk-app-1.0.zip

COPY *.sh /root/
EXPOSE 8000 5140
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
