FROM openrasp/tomcat:7.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN curl https://packages.baidu.com/app/groovy-all-2.3.9.jar -o /tomcat/lib/groovy-all-2.3.9.jar
# RUN curl http://central.maven.org/maven2/org/codehaus/groovy/groovy-all/2.3.9/groovy-all-2.3.9.jar -o /tomcat/lib/groovy-all-2.3.9.jar
RUN curl http://central.maven.org/maven2/org/apache/tomcat/tomcat-catalina-jmx-remote/7.0.4/tomcat-catalina-jmx-remote-7.0.4.jar -o /tomcat/lib/catalina-jmx-remote.jar

COPY conf/* /tomcat/conf/
COPY bin/* /tomcat/bin/

EXPOSE 80
EXPOSE 8080
EXPOSE 10001

