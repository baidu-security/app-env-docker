#!/bin/bash

set -ex -o pipefail

function build_rlwrap()
{
	if [[ -f /tmp/rlwrap/bin/rlwrap ]]; then
		echo rlwrap already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/rlwrap-0.43.tar.gz -o rlwrap.tar.gz
	tar -xf rlwrap.tar.gz

	cd rlwrap-*
    CFLAGS="-fPIC -m32 -I/build32/include" \
    LDFLAGS="-L/build32/lib" ./configure -q --prefix /tmp/rlwrap

    # 默认不写 history
    sed 's/static\s*int\s*write_histfile\s*=\s*TRUE/static int write_histfile = FALSE/' -i ./src/main.c

	make
	make install

	cd / && rm -rf "$dest"	
}

build_rlwrap
