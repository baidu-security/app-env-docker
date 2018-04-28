#!/bin/bash

set -ex -o pipefail

function build_socat()
{
	if [[ -f /tmp/release-x86/socat ]]; then
		echo socat already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/socat-1.7.3.2.tar.bz2 -o socat.tar.bz2
	tar -xf socat.tar.bz2

	cd socat-*

	# 静态编译
	sed 's#$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS)#$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS) -static -ldl#' -i Makefile.in

    CFLAGS="-m32 -fPIC -DWITH_OPENSSL -I/build32/include/ -DNETDB_INTERNAL=-1" \
    LDFLAGS="-L/build32/lib/ -ldl" ./configure -q --prefix /output/

	make

	upx -9 socat

	install -D socat /tmp/release-x86/socat

	cd / && rm -rf "$dest"	
}

build_socat
