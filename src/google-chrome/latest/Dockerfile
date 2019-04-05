FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

COPY *.repo /etc/yum.repos.d/
RUN yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi \
	xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc \
	xorg-x11-server-Xvfb google-chrome-stable -y

COPY *.sh /root/
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
