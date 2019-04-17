FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y centos-release-scl \
	&& yum install -y scl-utils policycoreutils-python mpfr-devel glibc-devel libcurl-devel pcre-devel

# clang 3.4
RUN yum install -y clang

# 安装 REMI 仓库
RUN curl https://packages.baidu.com/app/remi/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm \
	&& rm -f /tmp/remi-release-6.rpm

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

