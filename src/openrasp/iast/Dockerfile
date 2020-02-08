FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y gcc python36 python3-devel sqlite-devel
RUN pip3 install --upgrade git+https://github.com/baidu-security/openrasp-iast

COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
