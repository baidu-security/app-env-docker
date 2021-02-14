name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --cap-add=SYS_PTRACE --rm -i -t $(name)
