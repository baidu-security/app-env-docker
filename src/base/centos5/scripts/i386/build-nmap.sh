#!/bin/bash

set -ex -o pipefail

function build_nmap()
{
	if [[ -f /tmp/release-x86/nmap/bin/nmap ]]; then
		echo nmap already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/nmap-7.70.tar.bz2 -o nmap.tar.bz2
	tar -xf nmap.tar.bz2

	cd nmap-*/

	# 静态编译
	sed 's#$(CXX) $(LDFLAGS) -o $@ $(OBJS) main.o $(LIBS)#$(CXX) $(LDFLAGS) -o $@ $(OBJS) main.o $(LIBS) -static#' -i Makefile.in

  	CC="gcc -m32 -fPIC -DLUA_C89_NUMBERS" CXX="g++ -m32 -fPIC -DLUA_C89_NUMBERS" \
  	LD=ld LDFLAGS="-L/build32 -static-libgcc -L." ./configure -q \
       --without-ndiff \
       --without-zenmap \
       --without-nping \
       --without-ncat \
       --without-nmap-update \
       --with-pcap=/build32 \
       --with-libssh2=/build32 \
       --with-openssl=/build32 \
       --with-libdnet=included \
       --prefix /tmp/release-x86/nmap

	make
	make install

	upx -9 /tmp/release-x86/nmap/bin/nmap

	cd / && rm -rf "$dest"
}

build_nmap



