FROM openrasp/devtoolset-4

LABEL MAINTAINER="OpenRASP <ext_yunfenxi@baidu.com>"

RUN cd /root && \ 
    wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz && \
    xz -d Python-3.7.4.tar.xz && \
    tar -xf Python-3.7.4.tar

RUN yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

ENV PATH="$PATH:/opt/rh/devtoolset-4/root/usr/bin/"

RUN cd /root && \
    wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz && \
    tar -zxvf openssl-1.1.1a.tar.gz && \
    cd openssl-1.1.1a && \
    ./config --prefix=/usr/local/openssl no-zlib && \
    make && make install && \
    mv /usr/bin/openssl /usr/bin/openssl.bak && \
    mv /usr/include/openssl/ /usr/include/openssl.bak && \
    ln -s /usr/local/openssl/include/openssl /usr/include/openssl && \
    ln -s /usr/local/openssl/lib/libssl.so.1.1 /usr/local/lib64/libssl.so && \
    ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl && \
    echo "/usr/local/openssl/lib" >> /etc/ld.so.conf && \
    ldconfig

RUN cd /root/Python-3.7.4 && \
    ./configure --with-openssl=/usr/local/openssl --enable-shared && \
    make && make install && \
    echo "/usr/local/lib" >> /etc/ld.so.conf && \
    ldconfig

RUN pip3 install pyinstaller

COPY build.sh /root/
COPY requirements.txt /root/

RUN pip3 install -r /root/requirements.txt && \
    rm /root/requirements.txt