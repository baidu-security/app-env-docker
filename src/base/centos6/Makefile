name=openrasp/centos6

default: build run

build:
	cp -R ../centos7/control/*.sh etc/init.d
	docker build -t $(name) .
	rm -rf etc/init.d/*

run: build
	docker run --cap-add=SYS_PTRACE --rm -i -t $(name)
