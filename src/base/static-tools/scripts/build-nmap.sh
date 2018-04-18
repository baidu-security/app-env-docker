#!/bin/bash

set -ex -o pipefail

function build_nmap()
{
	if [[ -f /tmp/nmap/bin/nmap ]]; then
		echo nmap already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/nmap-7.70.tar.bz2 -o nmap.tar.bz2
	tar -xf nmap.tar.bz2

	cd nmap-*/
  	ln -sf `g++ -print-file-name=libstdc++.a`
  	CC="gcc -fPIC -DLUA_C89_NUMBERS" CXX="g++ -fPIC -DLUA_C89_NUMBERS" LD=ld LDFLAGS="-L/build -static-libgcc -L." ./configure -q \
       --without-ndiff \
       --without-zenmap \
       --without-nping \
       --without-ncat \
       --without-nmap-update \
       --with-pcap=/build \
       --with-libssh2=/build \
       --with-openssl=/build \
       --with-libdnet=included \
       --prefix /tmp/nmap/

	make
	make install

	cd / && rm -rf "$dest"
}

build_nmap



