#!/bin/bash

set -ex -o pipefail

function build_openssl()
{
	if [[ -f /build/lib/libssl.a ]]; then
		echo openssl already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/openssl-1.0.2j.tar.gz -o openssl.tar.gz
	tar -xf openssl.tar.gz

	cd openssl-*/
	CC='/usr/local/musl/bin/musl-gcc -static -fPIC' ./Configure --prefix=/build/ no-shared linux-x86_64

	make
	make install

	cd / && rm -rf "$dest"
}

function build_ncurses()
{
	if [[ -f /build/lib/libncurses.a ]]; then
		echo libncurses already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/ncurses-6.1.tar.gz -o ncurses.tar.gz
	tar -xf ncurses.tar.gz

	cd ncurses-*/
	CC='/usr/local/musl/bin/musl-gcc -static' CFLAGS='-fPIC' ./configure \
		-q \
		--prefix /build \
		--disable-shared \
		--enable-static \
		--with-terminfo-dirs=/usr/share/terminfo \
		--with-default-terminfo-dir=/usr/share/terminfo

	make
	make install

	cd / && rm -rf "$dest"
}

function build_readline()
{
	if [[ -f /build/lib/libreadline.a ]]; then
		echo libreadline already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/readline-6.3.tar.gz -o readline.tar.gz
	tar -xf readline.tar.gz

	cd readline-*/
	CC='/usr/local/musl/bin/musl-gcc -static' CFLAGS='-fPIC' ./configure -q --prefix /build --disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

function build_pcap()
{
	if [[ -f /build/lib/libpcap.a ]]; then
		echo libpcap already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/libpcap-1.4.0.tar.gz -o libpcap.tar.gz
	tar -xf libpcap.tar.gz

	cd libpcap-*/
	CFLAGS='-fPIC' ./configure -q --prefix /build --disable-shared

	make
	make install

	cd / && rm -rf "$dest"
}

function build_pcre()
{
	if [[ -f /build/lib/libpcre.a ]]; then
		echo pcre already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/pcre-8.41.tar.bz2 -o pcre.tar.bz2
	tar -xf pcre.tar.bz2

	cd pcre-*/
	CC='/usr/local/musl/bin/musl-gcc -static' CFLAGS='-fPIC' ./configure -q \
		--prefix /build \
		--disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

function build_libssh2()
{
	if [[ -f /build/lib/libssh2.a ]]; then
		echo libssh2 already built
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/libssh2-1.8.0.tar.gz -o libssh2.tar.gz
	tar -xf libssh2.tar.gz

	cd libssh2-*/
	CC='/usr/local/musl/bin/musl-gcc -static' CFLAGS='-fPIC -I/build/include' LDFLAGS="-L/build/lib" ./configure -q \
		--prefix /build \
		--disable-shared --enable-static

	make
	make install

	cd / && rm -rf "$dest"
}

function build_musl_gcc()
{
	if [[ -f /usr/local/musl/bin/musl-gcc ]]; then
		echo MUSL gcc already installed, skipping
		return
	fi

	dest=$(mktemp -d)
	cd "$dest"

	curl https://packages.baidu.com/app/musl-1.1.10.tar.gz -o musl.tar.gz
	tar -xf musl.tar.gz

	cd musl-*/

	# Build
	./configure -q --prefix=/usr/local/musl/

	make
	make install

	cd / && rm -rf "$dest"
}

build_musl_gcc
build_readline
build_openssl
build_ncurses
build_libssh2
build_pcap
build_pcre


