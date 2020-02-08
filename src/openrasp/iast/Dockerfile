FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y gcc python36 python3-devel sqlite-devel
RUN pip3 install -r https://raw.githubusercontent.com/baidu-security/openrasp-iast/master/openrasp_iast/requirements.txt

COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
