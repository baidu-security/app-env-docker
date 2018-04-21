#!/bin/bash

set -ex -o pipefail

function build_openssl()
{
	if [[ -f /build32/lib/libssl.a ]]; then
		echo openssl already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/openssl-1.0.2j.tar.gz -o openssl.tar.gz
	tar -xf openssl.tar.gz

	cd openssl-*/
	CC="gcc -m32 -fPIC" ./Configure \
		--prefix=/build32/ no-shared linux-generic32

	make
	make install

	cd / && rm -rf "$dest"
}

function build_ncurses()
{
	if [[ -f /build32/lib/libncurses.a ]]; then
		echo libncurses already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/ncurses-6.1.tar.gz -o ncurses.tar.gz
	tar -xf ncurses.tar.gz

	cd ncurses-*/
	CC="gcc -m32 -fPIC" CXXFLAGS="-fPIC -m32" CFLAGS="-fPIC -m32" ./configure \
		-q --prefix /build32/ --disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

function build_readline()
{
	if [[ -f /build32/lib/libreadline.a ]]; then
		echo libreadline already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/readline-6.3.tar.gz -o readline.tar.gz
	tar -xf readline.tar.gz

	cd readline-*/
	CC="gcc -m32 -fPIC" CXXFLAGS="-fPIC -m32" CFLAGS="-fPIC -m32" ./configure \
		-q --prefix /build32/ --disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

function build_pcap()
{
	if [[ -f /build32/lib/libpcap.a ]]; then
		echo libpcap already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/libpcap-1.4.0.tar.gz -o libpcap.tar.gz
	tar -xf libpcap.tar.gz

	cd libpcap-*/
	CXXFLAGS="-fPIC -m32" CFLAGS="-fPIC -m32" ./configure \
		-q --prefix /build32/ --disable-shared

	make
	make install

	cd / && rm -rf "$dest"
}

function build_pcre()
{
	if [[ -f /build32/lib/libpcre.a ]]; then
		echo pcre already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/pcre-8.41.tar.bz2 -o pcre.tar.bz2
	tar -xf pcre.tar.bz2

	cd pcre-*/
	CXXFLAGS="-fPIC -m32" CFLAGS="-fPIC -m32" ./configure \
		-q --prefix /build32/ \
		--disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

function build_libssh2()
{
	if [[ -f /build32/lib/libssh2.a ]]; then
		echo libssh2 already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/libssh2-1.8.0.tar.gz -o libssh2.tar.gz
	tar -xf libssh2.tar.gz

	cd libssh2-*/
	CXXFLAGS="-fPIC -m32 -I/build32/include" CFLAGS="-m32 -fPIC -I/build32/include" LDFLAGS=" -ldl -L/build32/lib" ./configure \
		-q --prefix /build32/ \
		--disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

build_readline
build_ncurses
build_pcap
build_pcre
build_libssh2
build_openssl
