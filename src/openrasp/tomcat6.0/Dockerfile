FROM openrasp/tomcat6.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 测试用例
ADD https://packages.baidu.com/app/openrasp/testcases/vulns.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/testcases/S2-016.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/testcases/fastjson.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/testcases/wxpay-xxe.war /tomcat/webapps/
ADD https://packages.baidu.com/app/webdav-demo.war /tomcat/webapps/

RUN rm -rf /tomcat/webapps/ROOT/*
COPY web/index.jsp /tomcat/webapps/ROOT/

COPY *.sh /root/
RUN chmod +x /root/*.sh

