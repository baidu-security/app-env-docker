FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/webwolf-8.0.0.M12.jar

# 下载
RUN curl "$install_url" -o /webwolf.jar

COPY start.sh /root/
ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
