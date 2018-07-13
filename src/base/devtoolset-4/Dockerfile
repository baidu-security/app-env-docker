FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装 devtools-4
RUN yum install -y centos-release-scl \
	&& yum install -y devtoolset-4-gcc-c++ make cmake re2c libuuid-devel libxml2-devel zlib-devel

# 安装 REMI 仓库
RUN curl http://rpms.famillecollet.com/enterprise/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
