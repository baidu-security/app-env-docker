FROM ubuntu:16.04

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN sed 's/archive.ubuntu/cn.archive.ubuntu/' -i /etc/apt/sources.list \
	&& apt update \
	&& apt install -y libssl-dev build-essential vim nano wget curl lrzsz

# 其他配置
COPY *.sh .bash* .vimrc /root/

ENTRYPOINT ["/bin/bash"]
