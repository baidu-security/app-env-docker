name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')

default: build run

build:
	docker build -t $(name) .

run: build
	export CONTAINER=$(shell docker run --cap-add=SYS_PTRACE --privileged=true --rm -d $(name) /usr/sbin/init); \
	docker exec -it $${CONTAINER}  /bin/bash -c "cd /tmp/nagiosxi && ./fullinstall"
