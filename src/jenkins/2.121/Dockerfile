FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/jenkins2.121.war
ENV install_url_bin  https://packages.baidu.com/app/jenkins2.121-bin.tar.gz
ENV install_path /root/

COPY start.sh /root/

# 下载
RUN curl "$install_url" -o "$install_path"/jenkins.war \
    && curl "$install_url_bin" -o "$install_path"/jenkins.tar.gz \
    && cd /root/ \
    && tar -zxf jenkins.tar.gz \
    && rm -f jenkins.tar.gz


RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

