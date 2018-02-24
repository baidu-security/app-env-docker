# name=openrasp/joomla:3.8.3
name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)
