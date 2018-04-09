#!/bin/bash

set -ex
cd "$(dirname "$0")"

GOPATH=$PWD go build -o /tmp/docker-socks5 
/tmp/docker-socks5