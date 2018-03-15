name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')
deps=../../base/$(shell head -1 Dockerfile | sed 's~FROM openrasp/~~; s~:~~')

default: build run

build:
	cp ../php-centos6-php5.3/build.sh .
	docker build -t $(name) .
	rm -f build.sh

run: build
	docker run --rm -v /tmp:/tmp -it $(name)

compile: build
	docker run --rm -v /tmp:/tmp -it $(name) /root/build.sh
