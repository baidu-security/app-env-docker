FROM openrasp/java6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp-maven-bootstrap.tar.bz2 /tmp/openrasp-maven-bootstrap.tar.bz2

RUN cd /tmp \
	&& curl https://packages.baidu.com/app/apache-maven-3.2.3-bin.tar.gz -o mvn.tar.gz \
	&& tar -xf mvn.tar.gz \
	&& mv apache-maven-3.2.3/ /maven \
	&& rm -f mvn.tar.gz

# 安装需要的 maven 包
RUN tar -xf /tmp/openrasp-maven-bootstrap.tar.bz2 -C /root/	

# 使用阿里云镜像
COPY maven/*.xml /root/.m2/
COPY *.sh /root/

# 使用 /root/build.sh 编译
RUN ln -s /maven/bin/mvn /usr/bin \
	&& chmod +x /root/*.sh
