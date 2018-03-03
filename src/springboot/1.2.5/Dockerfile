FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/spring-boot-cli-1.2.5.BUILD-20150701.141516-70-bin.tar.gz
ENV bin_url     https://packages.baidu.com/app/spring-boot-1.2.5-demo.jar

# 编译
# COPY index.groovy /tmp/
# RUN curl "$install_url" -o package.tar.gz \
# 	&& tar xf package.tar.gz -C /tmp \
# 	&& rm -f package.tar.gz \
# 	&& cd /tmp/spring-1.2.5.BUILD-SNAPSHOT \
# 	&& ./bin/spring run /tmp/index.groovy
#
# RUN curl "https://packages.baidu.com/app/commons-io-2.6.jar" -o commons-io-2.6.jar

RUN curl "$bin_url" -o /root/springboot.jar
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
EXPOSE 8080
