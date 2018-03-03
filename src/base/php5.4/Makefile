name=$(shell pwd | perl -lne 'print "openrasp/$$2" if /([^\/]+)\/([^\/]+)$$/')
deps=$(wildcard ../../base/$(shell head -1 Dockerfile | sed 's~FROM openrasp/~~; s~:~~'))

default: build run

build:
	$(MAKE) -C $(deps) build
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)
