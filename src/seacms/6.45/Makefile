# name=openrasp/seacms:6.45
name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)
