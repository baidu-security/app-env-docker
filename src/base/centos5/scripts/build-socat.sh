#!/bin/bash

set -ex -o pipefail

function build_socat()
{
	if [[ -f /tmp/socat/bin/socat ]]; then
		echo socat already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/socat-1.7.3.2.tar.bz2 -o socat.tar.bz2
	tar -xf socat.tar.bz2

	cd socat-*
    CC='/usr/local/musl/bin/musl-gcc -fPIC' \
    CFLAGS="-fPIC -DWITH_OPENSSL -I/build/include/ -DNETDB_INTERNAL=-1" \
    LDFLAGS="-L/build/lib/" ./configure -q --prefix /tmp/socat

	make
	make install

	cd / && rm -rf "$dest"	
}

build_socat
